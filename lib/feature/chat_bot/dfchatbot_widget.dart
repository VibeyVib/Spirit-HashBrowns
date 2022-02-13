import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';

class HomePageDialogflow extends StatefulWidget {
  HomePageDialogflow({Key? key, this.title = ""}) : super(key: key);

  final String title;

  @override
  _HomePageDialogflow createState() => new _HomePageDialogflow();
}

@override
class _HomePageDialogflow extends State<HomePageDialogflow> {
  FocusNode focusNode = FocusNode();
  String hintText = 'type something';
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = hintText;
      }
      setState(() {});
    });
  }

  Widget _buildTextComposer() {
    return Container(
      decoration:
      BoxDecoration(border: Border(top: BorderSide(color: Color.fromRGBO(98, 161, 214, 1)))),
      child: new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  focusNode: focusNode,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration.collapsed(hintText: hintText, hintStyle: TextStyle(color: Color.fromRGBO(98, 161, 214, 1))),
                ),
              ),

              //Commenting send button as per design but can be added later if req.
              /*
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text)),
              ), */
            ],
          ),
        ),
      ),
    );
  }

  void response(query) async {
    _textController.clear();
    DialogAuthCredentials credentials =
    await DialogAuthCredentials.fromFile("assets/dialog_flow_auth.json");

    DialogFlowtter dialogFlowtter = DialogFlowtter(
      credentials: credentials,
      sessionId: "12345678",
    );
    dialogFlowtter.projectId = 'vmha-chatbot-v1-gqxr';
    final QueryInput queryInput = QueryInput(
      text: TextInput(
        text: query,
        languageCode: "en",
      ),
    );

    final params = QueryParameters(
      contexts: [
        Context(
            name:
            "projects/{project_id=*}/locations/{location_id=*}/agent/environments/{environment_id=*}/users/{user_id=*}/sessions/{session_id=*}/contexts/start",
            lifespanCount: 10),
      ],
    );

    DetectIntentResponse response = await dialogFlowtter.detectIntent(
      queryInput: queryInput,
      queryParams: params,
    );

    String textResponse = response.text.toString();
    ChatMessage message = new ChatMessage(
      text: textResponse,
      //?? new CardDialogflow(response.props).title,

      name: "Serena",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          child: new Scaffold(
            body: new Column(children: <Widget>[
              new Flexible(
                  child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) => _messages[index],
                    itemCount: _messages.length,
                  )),
              new Divider(height: 1.0),
              new Container(
                decoration:
                new BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text = "", this.name = "", this.type = true});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      new Container(
        margin: const EdgeInsets.only(right: 3.0),
        child: new CircleAvatar(
          backgroundImage: AssetImage("assets/images/bot.jpeg"),
        ),
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //new Text(this.name, style: new TextStyle(fontWeight: FontWeight.bold)),
            new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black),
              margin: const EdgeInsets.only(top: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            //new Text(this.name, style: Theme.of(context).textTheme.subtitle1),
            new Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black),
              margin: const EdgeInsets.only(top: 5.0),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),

      /*User's Circle Avatar. Not req as per design
      new Container(
        margin: const EdgeInsets.only(left: 3.0),
        child: new CircleAvatar(
            child: new Text(
              this.name[0],
              style: new TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
      */
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}

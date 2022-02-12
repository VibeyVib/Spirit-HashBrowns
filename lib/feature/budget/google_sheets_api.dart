import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
   {
  "type": "service_account",
  "project_id": "hashbrowns",
  "private_key_id": "34d8334839b1aac30db1bc08b7e5f175808090d0",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCH1qYSQTyXyY15\nUjqRD5SE2Y8rWk3TSJsnSe8HZtgLJVionwAl64Q0Jvkvkza5I70bKM4sQNSWq10V\nucRgU62VhLu2Zf7CQm7u/z+QHHsB+hcgm15haiBJ/sepUyiXAuNwGMO/OWKUfCFR\nTxZlYN66tyG/4Punmb9XbS/FGgkSBZd/3jRJbu8el9g1zV2B25IfRFpCBpxHp7F3\n9gg+hva3Q22ctSL1eIXCGqUnc3DDv36E5EqoF1dPuPjMkqYlGissO1qVkhfU/Bo8\nOrZ55iPY+8Ewfe2tapsXRulq9Crzzi+k7/009fgWYPEMYqoCVAAFCgK3/ql8EAXt\nx7KG3pzvAgMBAAECggEAMVlQ0fbzTW2CwR2Xe1W+rhjfw282MNkCzN42QWkiecIi\nmHfTNPN//vZdtuPzkIUkUXacmEUhNm+hDKCFcD1WJaioDVa2m9pItPj0HaXLJme1\n+TmYqylD+73cyW4Vo+7/s5y7mH//iVQjQofJ6iCsKgcX8r6IjlXzxo47OY8A1pO7\n+qom9JIeJx0o5LjmoMoABr9rADHKETfIXdD1ocrOscnBQg6IHn3ABmnr+5QEBMUu\nIUqBbOU/P5WBp6g2io9yJZJU0aAUZz2CRLyNmjcltyV4EIXDglh1uKSzf6OwIuwF\nFSz7sjSqrH36uWVUK8XIzPQx+Y0o0dgcAueFbvoEcQKBgQC8e2vuR8t7ftYFM5KB\nQX/w/aEeOajfNqRPcS9lAdyTIR2ysqdh1moHnFGyrQK6MavqMJtKOyVTFURX+dIq\nEECSXa71QrgcVqEPrVNly1qw3NQVA+blQNgmLFoXn1wxrjcGriFnmd/ABDtKKG8I\n5px0nc0B886K5nSCtps4dLgf1wKBgQC4f5cgHlXd0kdNbJffys7G8GB6AIIvkSNz\nV4WPbxw//X44dZv46heuLRNWb7snvX3ri9tMtVf9Ov7ugaNw1khpoDY+ozb9KuBP\nS2ypJ1lKbKSUOqJdjGNneezfKttAvELfiPNegmKPqusoTOHWywhc6dXCwsyrBPKY\nssaVw2goqQKBgHZyVXxzz9M2/QZdx4bFA8MNkI/vCknkC9QEvBUM23H2kLQ5A2k/\nlnhb6xePFDSwfGn6y8wVaTpSFhX3X/ShLAMPLqDgodTlN+gjM1K4PbEBxaHDRvnx\nCyTKIH/R3N03r0raaRGzKGKCBkRvLn/4dH/wnuHINpchhjySxu7uorsXAoGAdwjC\nzVMlHT+tBzP37MhhjpLJ/AzV8bCXibQ/FKKgPFzlkbG3luoZqyOj5VGjE2m7kzwh\nmiUqBtSIZAM6GvP1tkhKlzEgqkh+fkpwadZcUpszt/r4hJiuDbXpcLaqzOJp1uT5\n99DxnDWvEMpBrx5BYAjyBH1AJVrE1mYJn9h6HDkCgYA/LARRkBlnporHNFGmfdo8\ndBK4v6iYUeq1NwQZ4bS5X17tbllQO23AsHO/akAKnkHrdsRwpry3uNTfYA5bsb7o\ncsY39yvp0t1+wgC1Q+0tFqUpP3IARpDO4j9rlHReH+c1d6IrKmXy+1j3Wks1nQ56\nJgwxzVtmVx4uWJ6mttY3xw==\n-----END PRIVATE KEY-----\n",
  "client_email": "hashbrown-spirit-sheet@hashbrowns.iam.gserviceaccount.com",
  "client_id": "108813768719219246158",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/hashbrown-spirit-sheet%40hashbrowns.iam.gserviceaccount.com"
}

  ''';

  // set up & connect to the spreadsheet
  static final _spreadsheetId = '1UdThEENrwAdUZz0Qiaw1jewMu1Azdl1RIf1ZK-0tZCQ';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // some variables to keep track of..
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialise the spreadsheet!
  Future init() async {
    print('Hi');
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    print('Bye');
    _worksheet = ss.worksheetByTitle('Sheet1');
    countRows();
    print('Hello');
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
        .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
      await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
      await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
      await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // insert a new transaction
  static Future insert(String name, String amount, bool _isIncome) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
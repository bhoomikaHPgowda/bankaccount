class Account {
  var name: String
  var initialAmount: Double
  var accountNumber: Int
  var accountBalance: Double
  var accountType: String
  var mobileNumber: Int?
  var email: String?
  
  init(name: String, accountType: String, mobileNumber: Int?, email: String? ) {
    self.name = name
    self.initialAmount = 0
    self.accountNumber = 0
    self.accountBalance = 0
    self.accountType = accountType
    self.mobileNumber = mobileNumber
    self.email = email
    
  }
func accountInterest() {
  let interestRate = 0.02
  let termOfDeposit = 3.0
  let balance = accountBalance
  if (accountType != "Recurring" || accountType != "Fixed") {
   
   accountBalance = (accountBalance *  interestRate * 365 )
   print("\(balance) after adding interest \(accountBalance)")	     
  }	     
  else {
    accountBalance = (accountBalance *  interestRate * termOfDeposit )
    print("\(balance) after adding interest \(accountBalance)")	     
  }
}

}


class Casa: Account {
  var casaAccountTypes: [String]

  init(casaAccountTypes: [String], name: String, accountType: String, mobileNumber: Int?, email: String?) {
      self.casaAccountTypes = casaAccountTypes
      super.init( name: name, accountType: accountType, mobileNumber: mobileNumber, email: email )
  }
  //casa account of two types that is current and savings which perform both deposit and withdraw operation. 
}

class Deposit: Account  {
  var depositAccountTypes: [String]

  init(depositAccountTypes: [String],  name: String, accountType: String, mobileNumber: Int?, email: String?) {
      self.depositAccountTypes = depositAccountTypes
      super.init( name: name, accountType: accountType, mobileNumber: mobileNumber, email: email )
  }
// deposit account of two types that is recurring and fixed which perform only deposit operation
}
class Loan: Account  {
  var loanAccountTypes: [String]

  init(loanAccountTypes: [String], name: String, accountType: String, mobileNumber: Int?, email: String?) {
      self.loanAccountTypes = loanAccountTypes
      super.init( name: name, accountType: accountType, mobileNumber: mobileNumber, email: email )
  }
// loan account of three types that is vehicleloan, personalLoan, houseLoan which perform only deposit operation.
}

class Manager {
  var accounts: [Account]
  var digit: Int
  var transaction: [String]

  init() {
    self.accounts = [Account]()
    self.digit = 1000000000000
    self.transaction = [String]()
    
  }
 
  func generateAccountNumber(number: Account) {
    self.accounts.append(number)
    number.accountNumber = digit + 1
    digit += 1
    //print(number.accountNumber)
  }

  func deposit(amount: Int, type: Account) {
    if((type.accountType == "current") || (type.accountType == "saving") || (type.accountType == "Recurring") || (type.accountType == "houseLoan") || (type.accountType == "vehicleLoan") || (type.accountType == "personalLoan")) {
      type.accountBalance = type.initialAmount + Double(amount) 
      type.initialAmount = type.accountBalance
      print(type.accountBalance)
      self.transaction.append("account is credit with \(amount) now balance is \(type.accountBalance)")
    }
    else if ((type.accountType == "Fixed") ) {
      type.accountBalance = type.initialAmount + Double(amount) 
      print(type.accountBalance)
      self.transaction.append("account is credit with \(amount) now balance is \(type.accountBalance)")
    }
    else {
      print("cannot deposit the amount")
    }
     
   }
  func withDraw(amount: Int, type: Account) {
    if((type.accountType == "current") || (type.accountType == "saving")) {
      type.accountBalance = type.initialAmount - Double(amount) 
      type.initialAmount = type.accountBalance
      print(type.accountBalance)
      self.transaction.append("account is debit with \(amount) now balance is \(type.accountBalance)")
    }
    else {
      print("cannot withdraw the amount")
    }
      
  }

func accountDetails() {
    for account in accounts {
      print("account details of \(account.name) ")
      print("-------------------------------")
      print("account number = \(account.accountNumber)")
      print("account type = \(account.accountType)")
      print("account ballance = \(account.accountBalance)")
      print("\n")
    }
  }
  
func transactionStatement() {
  let value = transaction.count - 10
  for value in value..<transaction.count  {
    print(transaction[value])
  }
}  

func changeAccount(detail: Account, type: String) {
  if(detail.mobileNumber != nil && detail.email != nil) {
    print("u can change your account")
    detail.accountType = type
    print("your new account type is \(detail.accountType)")
  }
  else {
    print("u can't change your account")
  }
}
}

class Request {
  var task:  [String]
  var accNumber: [Int]
  var requirements: [Any]
  var accounts: [Account]
  var m: Manager
  var users: [User]

  init() {
    self.task = [String]()
    self.accNumber = [Int]()
    self.requirements = [Any]()
    self.accounts = [Account]()
    self.m = Manager()
    self.users = [User]()
  }

func addAccount(account: Account) {
    self.accounts.append(account)
   }
func addUser(user: User) {
  self.users.append(user)
  self.task.append(user.activity)
  self.accNumber.append(user.accHolderNumber)
  self.requirements.append(user.request)
}


func solveRequest() {
  for account in accounts {
    for i in 0..<task.count {
           if (task[i] == "depositMoney" && accNumber[i] == account.accountNumber) {
             if let temp = requirements[i] as? Int {
                m.deposit(amount:temp , type: account)
                account.accountInterest()
             }
            
            }
           else if (task[i] == "withDrawMoney" && accNumber[i] == account.accountNumber) {
             if let temp = requirements[i] as? Int {
                m.withDraw(amount:temp , type: account)
                account.accountInterest()
              }
            }
           else if (task[i] == "gattingBalance" && accNumber[i] == account.accountNumber) {
              print( "account balance is \(account.accountBalance)")
          }
          else if (task[i] == "createAccount")  {
            m.generateAccountNumber(number: account)
            
        }       
      }
    }
     m.accountDetails()
  }

  
}

class User {
    
    var activity: String
    var accHolderNumber: Int
    var request: Any

    init(activity: String, accHolderNumber: Int, request: Any) {
        self.activity = activity
        self.accHolderNumber = accHolderNumber
        self.request = request
    }
    
}

let acc1 = Account(name: "bhoomika", accountType: "current", mobileNumber: 9233215523, email: "bhoomika@gmail.com" )

let acc2 = Account(name: "navya", accountType: "saving", mobileNumber: nil, email: "navya@gmail.com" )

let acc3 = Account(name: "bindhu", accountType: "Recurring", mobileNumber: 9553555352, email: "bindhu@gmail.com" )

let acc4 = Account(name: "supriya", accountType: "Fixed", mobileNumber: 9553558952, email: "supriya@gmail.com" )

let M = Manager()
M.generateAccountNumber(number: acc1)
M.generateAccountNumber(number: acc2)
M.generateAccountNumber(number: acc3)
print(acc1.accountNumber)

M.deposit(amount: 2000, type: acc1)
M.deposit(amount: 5000, type: acc2)
M.withDraw(amount: 2000, type: acc1)
M.deposit(amount: 3000, type: acc1)
M.deposit(amount: 2000, type: acc2)
M.withDraw(amount: 1000, type: acc1)
M.deposit(amount: 50000, type: acc1)
M.deposit(amount: 20000, type: acc2)
M.deposit(amount: 2000, type: acc1)
M.deposit(amount: 5000, type: acc2)
M.withDraw(amount: 2000, type: acc1)
M.deposit(amount: 3000, type: acc1)
M.deposit(amount: 2000, type: acc2)
M.deposit(amount: 5000, type: acc3)
M.withDraw(amount: 2000, type: acc3)
M.deposit(amount: 3000, type: acc2)
M.deposit(amount: 2000, type: acc2)

M.accountDetails()
M.changeAccount(detail: acc2, type: "Recurring")

M.transactionStatement()

acc1.accountInterest()
acc2.accountInterest()

let user1 = User(activity: "depositMoney", accHolderNumber: 1000000000001, request: 500)
let user2 = User(activity: "withDrawMoney", accHolderNumber: 1000000000001, request: 6000)
let user3 = User(activity: "gattingBalance", accHolderNumber: 1000000000002, request: "ballance")
var user4 = User(activity: "createAccount", accHolderNumber: 0, request: "createNewAccount")


let r = Request()
r.addAccount(account:acc1)
r.addAccount(account:acc2)
r.addAccount(account:acc3)
r.addAccount(account:acc4)
r.addUser(user: user1)
r.addUser(user: user2)
r.addUser(user: user3)
r.addUser(user: user4)
r.solveRequest()

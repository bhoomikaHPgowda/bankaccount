
class Account {
  var name: String
  var initialAmount: Double
  var accountType: String
  var addAmount: Int
  var totalAmount: Double
  //var accountNumber: Int
  var casaacc: [CasaAccount]
  var deposit: [DepositAccount]
  var loanacc: [LoanAccount]
  

  init(name: String, initialAmount: Double, accountType: String , addAmount: Int ) {
    self.name = name
    self.initialAmount = initialAmount
    self.accountType = accountType
    self.addAmount = addAmount
    self.totalAmount = 0
    casaacc = [CasaAccount]()
    deposit = [DepositAccount]()
    loanacc = [LoanAccount]()
   // self.accountNumber = 1230000000001
    }

  func deposit(addAmount: Int, accountType: String) {
    if((accountType == "current") || (accountType == "saving") || (accountType == "Recurring") || (accountType == "houseLoan") || (accountType == "vehicleLoan") || (accountType == "personalLoan")) {
     totalAmount = initialAmount + Double(addAmount) 
      initialAmount = totalAmount
      print(totalAmount)
    }
    else if ((accountType == "Fixed") ) {
      totalAmount = initialAmount + Double(addAmount)
      print(totalAmount) 
    }
    else {
      print("cannot deposit the amount")
    }
     
   }
  func withDraw(addAmount: Int, accountType: String) {
    if((accountType == "current") || (accountType == "saving")) {
      totalAmount = initialAmount - Double(addAmount) 
      initialAmount = totalAmount
      print(totalAmount)
    }
    else {
      print("cannot withdraw the amount")
    }
      
  }

  func addCasaAccount(acc: CasaAccount ) {
    self.casaacc.append(acc)
  }
  func addDepositAccount(acc: DepositAccount ) {
    self.deposit.append(acc)
  }
  func addLoanAccount(acc: LoanAccount ) {
    self.loanacc.append(acc)
  }
  

}
 class manager {
   var accounts: [Account]
   var accountNumber: Int
  
  init() {
      self.accounts = [Account]()
      self.accountNumber = 1230000000001
      }

 func addAccount(account: Account) {
		accounts.append(account)
	}

 func getAccountNumber(account: Account)  {
		print("\(account.name), your Account number is \(accountNumber)")
		accountNumber += 1
	}
 }

class CasaAccount: Account {
  var casaAccountType: [String]
  

  init(casaAccountType: [String], name: String, initialAmount: Double, accountType: String , addAmount: Int ){
    self.casaAccountType = casaAccountType
    super.init(name: name, initialAmount: initialAmount, accountType: accountType , addAmount: addAmount )
  }
   
  func amountDeposit(a: Int, type: String) {
    deposit(addAmount: a, accountType: type)
  }

  func amountWithDraw(amount: Int, accType: String) {
    withDraw(addAmount: amount, accountType: accType) 
  }
}
class DepositAccount: Account {
  var depositAccountType: [String]
  

  init(depositAccountType: [String], name: String, initialAmount: Double, accountType: String , addAmount: Int ){
    self.depositAccountType = depositAccountType
    super.init(name: name, initialAmount: initialAmount, accountType: accountType , addAmount: addAmount )
  }
   
  func amountDeposit(a: Int, type: String) {
    deposit(addAmount: a, accountType: type)
  }
  func amountWithDraw(amount: Int, accType: String) {
    withDraw(addAmount: amount, accountType: accType) 
  }
}

class LoanAccount: Account {
  var loanAccountType: [String]
  

  init(loanAccountType: [String], name: String, initialAmount: Double, accountType: String , addAmount: Int ){
    self.loanAccountType = loanAccountType
    super.init(name: name, initialAmount: initialAmount, accountType: accountType , addAmount: addAmount )
  }
   
  func amountDeposit(a: Int, type: String) {
    deposit(addAmount: a, accountType: type)
  }
  func amountWithDraw(amount: Int, accType: String) {
    withDraw(addAmount: amount, accountType: accType) 
  }
}


let bhoomika = Account(name: "bhoomik", initialAmount: 0, accountType: "current" , addAmount: 2000)
  bhoomika.deposit(addAmount: 2000, accountType: "saving") 

let navya = Account(name: "navy", initialAmount: 50, accountType: "String" , addAmount: 5000)

let m = manager()
m.addAccount(account: bhoomika)
m.addAccount(account: navya)
m.getAccountNumber(account: bhoomika)
m.getAccountNumber(account: navya)
print(m.accounts)


  let casa = CasaAccount(casaAccountType: ["saving", "current"],name: "bhoomik", initialAmount: 0, accountType: "current" , addAmount: 2000)
  casa.amountDeposit(a: 2000, type: "saving")
  casa.amountWithDraw(amount: 2000, accType: "current")
  bhoomika.addCasaAccount(acc: casa )

  let d = DepositAccount(depositAccountType: ["Fixed"	,"Recurring"], name: "navya", initialAmount: 500, accountType: "Recurring" , addAmount: 3000)
  d.amountDeposit(a: 3000, type: "Recurring")
  d.amountWithDraw(amount: 1000, accType: "Recurring")
  bhoomika.addDepositAccount(acc: d )

  let loan = LoanAccount(loanAccountType: ["houseLoan" ,	"vehicleLoan", "personalLoan"],name: "bindu", initialAmount: 50000, accountType: "houseLoan" , addAmount: 0)
  loan.amountDeposit(a: 2000, type: "houseLoan")
  loan.amountWithDraw(amount: 2000, accType: "personalLoan")
  bhoomika.addLoanAccount(acc: loan )
 
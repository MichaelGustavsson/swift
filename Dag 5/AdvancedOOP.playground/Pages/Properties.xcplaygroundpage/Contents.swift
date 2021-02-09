//: [Previous](@previous)

struct User {
    var name: String
}

class BankAccount {
    private var _balance: Double = 0.0
    //Private variable...
    private var _user: User
    var accountNo: String
    
    //Property
    var user: User {
        get {
            return _user
        }
    }
    
    //Lazy Property
    lazy var canWithdraw: Bool = {
        
        if balance <= 0 {
            return false
        }
        
        return true
    }()
    
    //Typed Property
    static var numberOfAccounts: Int = 0
    
    //Computed Property
    var balance: Double{
        get {
            return _balance
        }
        set(value){
            _balance += value
        }
    }
    init(user: User, deposit: Double) {
        self._user = user
        _balance = deposit
        self.accountNo = ""
        
        BankAccount.numberOfAccounts += 1
    }
    
    func deposit(amount: Double) {
        print("Balance before deposit: \(balance), \(amount)")
        _balance += amount
        print("Balance after deposit: \(balance), \(amount)")
    }
    
    func withDraw(amount: Double) -> Double{
        if(amount > balance){
            return balance
        }
        _balance -= amount
        return amount
    }
}

class SavingsAccount: BankAccount{
    
    let withDrawLimit = 500.0
        
    override init(user: User, deposit: Double) {
        super.init(user: user, deposit: deposit)
    }
}

let user = User(name: "Bosse")
let account = SavingsAccount(user: user, deposit: 1000.0)

print("Jag kan ta ut \(account.balance)")

account.deposit(amount: 200.0)
print("Jag kan ta ut \(account.balance)")

print("Hur många konton har jag: \(BankAccount.numberOfAccounts)")

let baseAccount = BankAccount(user: user, deposit: 2000)

print("Hur många konton har jag: \(BankAccount.numberOfAccounts)")



//: [Next](@next)

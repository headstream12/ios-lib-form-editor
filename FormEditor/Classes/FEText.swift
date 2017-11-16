import UIKit

public class FEText: PFEParam {
    public var id: String
    public var cellReuseId = "FEText"
    public var cellNibName = "FEText"
    public var allowReuseCell = true
    
    public var accessibilityIdentifier: String?
    public var title: String?
    public var value: String?
    public var keyboardType: UIKeyboardType
    public var autocapitalizationType: UITextAutocapitalizationType
    public var inputMask: String?
    public var readOnly: Bool = false
    public var inputMaskForwardDecoration: Bool
    public var visible: Bool = true
    public var maxLength: Int?
    
    public var accessoryImageNames: [String]
    
    public var valueChangeListener: ((String?) -> Void)?
    public var configureCell: ((UITableViewCell) -> Void)?
    
    public init(id: String, title: String? = nil, reuseId: String = "FEText", nibName: String = "FEText", value: String? = nil, keyboardType: UIKeyboardType = .default, autocapitalizationType: UITextAutocapitalizationType = .none, inputMask: String? = nil, inputMaskForwardDecoration: Bool = true, maxLength: Int? = nil, readOnly: Bool = false, accessoryImageNames: [String] = [], visible: Bool = true, accessibilityIdentifier: String? = nil, listener: ((String?) -> Void)? = nil, configureCell: ((UITableViewCell) -> Void)? = nil) {
        self.id = id
        self.title = title
        self.value = value
        self.cellReuseId = reuseId
        self.cellNibName = nibName
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        self.inputMask = inputMask
        self.inputMaskForwardDecoration = inputMaskForwardDecoration
        self.maxLength = maxLength
        self.readOnly = readOnly
        self.visible = visible
        self.accessibilityIdentifier = accessibilityIdentifier
        self.valueChangeListener = listener
        self.accessoryImageNames = accessoryImageNames
        self.configureCell = configureCell
    }
    
    public var canReceiveFocus: Bool {
        return !readOnly && isVisible()
    }
    
    public func configure(cell: UITableViewCell, facade: FormParamFacade) {
        if let paramCell = cell as? FETextCell {
            paramCell.configure(facade: facade)
            configureCell?(cell)
        }
    }
    
    public func select() {
        
    }
    
    func onValueChanged(_ newValue: String?) {
        if value != newValue {
            value = newValue
            valueChangeListener?(newValue)
        }
    }
    
    public func isVisible() -> Bool {
        return visible
    }
    
    public func equals(other: PFEParam) -> Bool {
        guard let other = other as? FEText else {
            return false
        }
        
        return other.id == id &&
            other.value == value &&
            other.title == title &&
            other.inputMask == inputMask &&
            other.keyboardType == keyboardType &&
            other.autocapitalizationType == autocapitalizationType &&
            other.readOnly == readOnly
    }
}

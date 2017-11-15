import UIKit

public class FEDate: PFEParam {
    public var id: String
    public var cellNibName = "FEDate"
    public var cellReuseId = "FEDate"
    public var allowReuseCell = true
    public var canReceiveFocus = true
    
    public var title: String?
    public var value: Date?
    public var displayableValueFormat: String
    public var readOnly: Bool
    public var minDate: Date
    public var maxDate: Date
    public var visible: Bool
    public var accessibilityIdentifier: String?
    
    public var valueChangeListener: ((Date) -> Void)?
    public var onEndEditing: (() -> Void)?
    public var configureCell: ((UITableViewCell) -> Void)?
    
    public init(id: String, reuseId: String = "FEDate", nibName: String = "FEDate", paramName: String? = nil, title: String? = nil, value: Date? = nil, displayableValueFormat: String = "%@", minDate: Date, maxDate: Date, readOnly: Bool = false, visible: Bool = true, accessibilityIdentifier: String? = nil, listener: ((Date) -> Void)? = nil, configureCell: ((UITableViewCell) -> Void)? = nil, onEndEditing: (() -> Void)? = nil) {
        self.id = id
        self.title = title
        self.value = value
        self.cellNibName = nibName
        self.cellReuseId = reuseId
        self.displayableValueFormat = displayableValueFormat
        self.readOnly = readOnly
        self.visible = visible
        self.accessibilityIdentifier = accessibilityIdentifier
        self.minDate = minDate
        self.maxDate = maxDate
        self.valueChangeListener = listener
        self.configureCell = configureCell
        self.onEndEditing = onEndEditing
    }
    
    public func configure(cell: UITableViewCell, facade: FormParamFacade) {
        if let paramCell = cell as? FEDateCell {
            paramCell.configure(facade: facade)
            configureCell?(cell)
        }
    }
    
    public func select() {
        
    }
    
    public func onValueChanged(_ newValue: Date) {
        value = newValue
        valueChangeListener?(newValue)
    }
    
    public func didEndEditing() {
        onEndEditing?()
    }
    
    public func isVisible() -> Bool {
        return visible
    }
    
    public func equals(other: PFEParam) -> Bool {
        guard let other = other as? FEDate else {
            return false
        }
        
        return other.id == id &&
            other.value == value &&
            other.title == title &&
            other.minDate == minDate &&
            other.maxDate == maxDate &&
            other.readOnly == readOnly
    }
}

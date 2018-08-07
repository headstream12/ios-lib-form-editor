import UIKit

public class FECustom: PFEParam {
    public var id: String
    public var cellReuseId: String
    public var cellNibName: String
    public var allowReuseCell = true
    public var notifiesAboutDisplayReadiness = false
    public var cellBundle: Bundle

    public var visible: Bool
    public var separatorVisible: Bool
    public var onSelect: (() -> Void)?
    
    public var cellHeight: CGFloat?
    
    public var configureCell: ((UITableViewCell) -> Void)?
    
    public var comparisonData: [String: AnyHashable] = [:]
    
    // Пользуемся этим замыканием, если ячейке требуется обращаться к фасаду параметра
    public var configureCellWithParamFacade: ((UITableViewCell, FormParamFacade) -> Void)?
    
    /**
     При указании nibName не забываем указать Bundle, в котором искать xib.
     Bundle(for: MyClass.self)
     */
    public init(id: String, reuseId: String = "", nibName: String = "", bundle: Bundle? = nil, visible: Bool = true, canReceiveFocus: Bool = false, separatorVisible: Bool = true, onSelect: (() -> Void)? = nil, comparisonData: [String: AnyHashable] = [:], configureCell: ((_ cell: UITableViewCell) -> Void)? = nil) {
        self.id = id
        self.cellReuseId = reuseId
        self.cellNibName = nibName
        self.allowReuseCell = nibName == ""
        self.cellBundle = bundle ?? Bundle(for: FEViewController.self)
        self.visible = visible
        self.canReceiveFocus = canReceiveFocus
        self.separatorVisible = separatorVisible
        self.onSelect = onSelect
        self.configureCell = configureCell
        self.comparisonData = comparisonData
    }
    
    public func configure(cell: UITableViewCell, facade: FormParamFacade) {
        if configureCellWithParamFacade != nil {
            configureCellWithParamFacade?(cell, facade)
        }
        else {
            configureCell?(cell)
        }
        
        if !separatorVisible {
            cell.separatorInset = UIEdgeInsetsMake(0, 10000, 0, 0)
        }
    }
    
    public func redrawIfNeeded(cell: UITableViewCell) {
        
    }
    
    public var canReceiveFocus: Bool
    
    public func select() {
        onSelect?()
    }
    
    public func isVisible() -> Bool {
        return visible
    }
    
    public func equals(other: PFEParam) -> Bool {
        guard let otherCustom = other as? FECustom else {
            return false
        }
        if otherCustom.comparisonData.count == 0 || comparisonData.count == 0 {
            return false
        }
        for (key, value) in otherCustom.comparisonData {
            if !(comparisonData[key] == value) {
                return false
            }
        }
        return true
    }
}

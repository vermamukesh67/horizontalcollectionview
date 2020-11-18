import UIKit
public class DataCardView: UIView {
    @IBOutlet weak private(set) var lblLabel: UILabel! {
        didSet {
            lblLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            lblLabel.textColor = UIColor.black
        }
    }
    @IBOutlet weak private(set) var lblTitle: UILabel! {
        didSet {
            lblTitle.font = UIFont.systemFont(ofSize: 13.0)
            lblTitle.textColor = UIColor.gray
        }
    }
    @IBOutlet weak private(set) var leftlblLabel: UILabel! {
        didSet {
            leftlblLabel.font = UIFont.systemFont(ofSize: 13.0)
            leftlblLabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        }
    }
    @IBOutlet weak private(set) var leftlblTitle: UILabel! {
        didSet {
            leftlblTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
            leftlblTitle.textColor = UIColor.black
        }
    }
    @IBOutlet weak private(set) var rightlblLabel: UILabel! {
        didSet {
            rightlblLabel.font = UIFont.systemFont(ofSize: 13.0)
            rightlblLabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        }
    }
    @IBOutlet weak private(set) var rightlblTitle: UILabel! {
        didSet {
            rightlblTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
            rightlblTitle.textColor = UIColor.black
        }
    }
    @IBOutlet weak private(set) var sepView: UIView!
    @IBOutlet weak private(set) var cornerRadiusView: UIView!
    @IBOutlet weak private(set) var footerView: FooterView!
    /// container view
    var containerView: UIView?
    /**
     Initializes and returns a newly allocated view object with the specified frame rectangle.
     - parameter frame:   The frame rectangle for the view
     - returns: An initialized view object.
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    /**
     Initializes and returns a newly allocated view object.
     - returns: An initialized view object.
     */
    public init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    /**
     Returns an object initialized from data in a given unarchiver.
     - parameter decoder:   An unarchiver object.
     - returns: self, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    /// Initilize the view from the nib
    fileprivate func commonInit() {
        containerView = fromNib(nibName: "DataCardView")
        setupUI()
    }
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.clear
        sepView.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        containerView?.backgroundColor = UIColor.white
        cornerRadiusView.backgroundColor = UIColor.clear
        layer.shadowOpacity = 0.2
    }
    /// Sets the label.
    public var label: String? {
        didSet {
            lblLabel.text = self.label
        }
    }
    /// Sets the title.
    public var title: String? {
        didSet {
            lblTitle.text = self.title
        }
    }
    /// Sets the left label.
    public var leftLabel: String? {
        didSet {
            leftlblLabel.text = leftLabel
        }
    }
    /// Sets the left title.
    public var leftTitle: String? {
        didSet {
            leftlblTitle.text = leftTitle
        }
    }
    /// Sets the right label.
    public var rightLabel: String? {
        didSet {
            rightlblLabel.text = rightLabel
        }
    }
    /// Sets the right title.
    public var rightTitle: String? {
        didSet {
            rightlblTitle.text = rightTitle
        }
    }
    /// Sets the footer label.
    public var footerLabel: String? {
        didSet {
            footerView.label = footerLabel
        }
    }
    /// Sets the footer title.
    public var footerTitle: String? {
        didSet {
            footerView.title = footerTitle
        }
    }
    /// Sets the footer image.
    public var footerImage: UIImage? {
        didSet {
            footerView.image = footerImage
        }
    }
}

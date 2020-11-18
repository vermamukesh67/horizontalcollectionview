import UIKit
class FooterView: UIView {
    @IBOutlet weak private(set) var lblLabel: UILabel! {
        didSet {
            lblLabel.font = UIFont.systemFont(ofSize: 13.0)
            lblLabel.textColor = UIColor.white
        }
    }
    @IBOutlet weak private(set) var lblTitle: UILabel! {
        didSet {
            lblTitle.font = UIFont.boldSystemFont(ofSize: 15.0)
            lblTitle.textColor = UIColor.white
        }
    }
    @IBOutlet weak private(set) var imgView: UIImageView!
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
        _ = fromNib(nibName: "FooterView")
        setupUI()
    }
    func setupUI() {
        self.backgroundColor = UIColor.red
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
    /// Sets the image.
    public var image: UIImage? {
        didSet {
            imgView.image = image
        }
    }
}

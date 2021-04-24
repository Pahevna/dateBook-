//
//  Auth.swift
//  task3
//
//  Created by mac on 09.11.2020.
//

import UIKit

protocol AuthViewDelegate: class {
    func didUpdateText(typeText: TypeText, text: String)
}

enum TypeText {
    case userName
    case password
}

@IBDesignable class AuthView: UIView, UITextFieldDelegate {
    
    // MARK: - Public Properties
    
    weak var delegate: AuthViewDelegate?
    var typeText = TypeText.userName
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var txtAuth: UITextField!
        
    // MARK: - IBInspectable
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            imgView.image = image
        }
    }
   
    @IBInspectable var placeholder: String? {
        didSet {
            txtAuth.placeholder = placeholder
        }
    }
    
    @IBInspectable var isSecurityTextEntry = false {
        didSet {
            txtAuth.isSecureTextEntry = isSecurityTextEntry
        }
    }
    
    // MARK: - Initialization 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        guard let xibViews = loadViewFromXib() else { return }
        xibViews.frame = self.bounds
        xibViews.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibViews)
    }
    
    private func loadViewFromXib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AuthView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // MARK: - Text Field Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn: NSRange, replacementString: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(shouldChangeCharactersIn, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: replacementString)
            delegate?.didUpdateText(typeText: typeText, text: updatedText)
        }
         return true
    }
}

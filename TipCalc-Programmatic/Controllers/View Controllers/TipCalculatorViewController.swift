//
//  TipCalculatorViewController.swift
//  TipCalc-Programmatic
//
//  Created by Devin Flora on 2/9/21.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        addAllSubviews()
        constrainCalcTitleLabel()
        setupBillStackView()
        setupNumOfPeopleStackView()
        setupTipButtonStackView()
        setupTipTotalStackView()
        setupButtonStackView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .tan
    }
    
    // MARK: - Properties
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    var tipAmount: Float = 0.0
    
    // MARK: - Methods
    func addAllSubviews() {
        self.view.addSubview(tipCalculatorLabel)
        self.view.addSubview(billAmountLabel)
        self.view.addSubview(billTextField)
        self.view.addSubview(billAmountStackView)
        self.view.addSubview(numofPeopleLabel)
        self.view.addSubview(numberOfPeopleTextField)
        self.view.addSubview(numOfPeopleStackView)
        self.view.addSubview(tipAmountStackView)
        self.view.addSubview(fifteenPercentButton)
        self.view.addSubview(twentyPercentButton)
        self.view.addSubview(twentyFivePercentButton)
        self.view.addSubview(clearButton)
        self.view.addSubview(calculateButton)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(tipTotalLabel)
        self.view.addSubview(tipAmountTotalLabel)
        self.view.addSubview(tipTotalStackView)
    }
    
    func constrainCalcTitleLabel() {
        tipCalculatorLabel.topAnchor.constraint(equalTo: self.safeArea.topAnchor, constant: 16).isActive = true
        tipCalculatorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func setupBillStackView() {
        billAmountStackView.addArrangedSubview(billAmountLabel)
        billAmountStackView.addArrangedSubview(billTextField)
        
        billAmountStackView.anchor(top: tipCalculatorLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 50, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
    }
    
    func setupNumOfPeopleStackView() {
        numOfPeopleStackView.addArrangedSubview(numofPeopleLabel)
        numOfPeopleStackView.addArrangedSubview(numberOfPeopleTextField)
        
        numOfPeopleStackView.anchor(top: billAmountStackView.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 30, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
    }
    
    func setupTipButtonStackView() {
        tipAmountStackView.addArrangedSubview(fifteenPercentButton)
        tipAmountStackView.addArrangedSubview(twentyPercentButton)
        tipAmountStackView.addArrangedSubview(twentyFivePercentButton)
        
        tipAmountStackView.anchor(top: numofPeopleLabel.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
    }
    
    func setupTipTotalStackView() {
        tipTotalStackView.addArrangedSubview(tipAmountTotalLabel)
        tipTotalStackView.addArrangedSubview(tipTotalLabel)
        
        tipTotalStackView.anchor(top: tipAmountStackView.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeft: 16, paddingRight: 16)
    }
    
    func setupButtonStackView() {
        buttonStackView.addArrangedSubview(clearButton)
        buttonStackView.addArrangedSubview(calculateButton)
        
        buttonStackView.anchor(top: tipTotalStackView.bottomAnchor, bottom: nil, leading: safeArea.leadingAnchor, trailing: safeArea.trailingAnchor, paddingTop: 50, paddingBottom: 0, paddingLeft: 20, paddingRight: 20)
    }
    
    @objc func clearButtonTapped() {
        clearTextFields()
        fifteenPercentButton.backgroundColor = .superTeal
        twentyPercentButton.backgroundColor = .superTeal
        twentyFivePercentButton.backgroundColor = .superTeal
    }
    
    @objc func calculateButtonTapped() {
        guard let bill = billTextField.text, !bill.isEmpty,
              let people = numberOfPeopleTextField.text, !people.isEmpty else { return }
        let calculatedTip = CalculatorController.shared.calculateTipTotal(billTotal: Float(bill) ?? 0, numberOfPeople: Int(people) ?? 0, tipPercentage: tipAmount)
        tipTotalLabel.text = String(format: "$%.2f", calculatedTip)
    }
    
    @objc func fifteenPercenTip() {
        fifteenPercentButton.backgroundColor = .moneyGreen
        twentyPercentButton.backgroundColor = .superTeal
        twentyFivePercentButton.backgroundColor = .superTeal
        tipAmount = 0.15
        
    }
    
    @objc func twentyPercenTip() {
        fifteenPercentButton.backgroundColor = .superTeal
        twentyPercentButton.backgroundColor = .moneyGreen
        twentyFivePercentButton.backgroundColor = .superTeal
        tipAmount = 0.20
        
    }
    
    @objc func twentyFivePercenTip() {
        fifteenPercentButton.backgroundColor = .superTeal
        twentyPercentButton.backgroundColor = .superTeal
        twentyFivePercentButton.backgroundColor = .moneyGreen
        tipAmount = 0.25
        
    }
    
    func clearTextFields() {
        billTextField.text = ""
        numberOfPeopleTextField.text = ""
        tipTotalLabel.text = ""
    }
    
    // MARK: - Views
    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.obsidian, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .superTeal
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.obsidian, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .superTeal
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let fifteenPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("15%", for: .normal)
        button.setTitleColor(.obsidian, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .superTeal
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(fifteenPercenTip), for: .touchUpInside)
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.setTitleColor(.obsidian, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .superTeal
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(twentyPercenTip), for: .touchUpInside)
        return button
    }()
    
    let twentyFivePercentButton: UIButton = {
        let button = UIButton()
        button.setTitle("25%", for: .normal)
        button.setTitleColor(.obsidian, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = .superTeal
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(twentyFivePercenTip), for: .touchUpInside)
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - TextFields
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "bill amount..."
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.font = textField.font?.withSize(18)
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    let numberOfPeopleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "people..."
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 4
        textField.font = textField.font?.withSize(18)
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    // MARK: - Labels
    let tipCalculatorLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip Calculator"
        label.textColor = .indigo
        label.font = label.font.withSize(35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Amount: "
        label.font = label.font.withSize(18)
        return label
    }()
    
    let numofPeopleLabel: UILabel = {
        let label = UILabel()
        label.text = "Number of People: "
        label.font = label.font.withSize(18)
        return label
    }()
    
    let tipAmountTotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Tip Amount: "
        label.font = label.font.withSize(18)
        return label
    }()
    
    let tipTotalLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = label.font.withSize(18)
        return label
    }()
    
    // MARK: - Stack Views
    let billAmountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipAmountStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let tipTotalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let numOfPeopleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
}//End of Class

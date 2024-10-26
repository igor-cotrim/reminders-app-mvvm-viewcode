import UIKit

class ReminderCell: UITableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    @objc private func buttonTapped() {
        btnIsTouched?() // Executa a closure quando o botão é tocado
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 1
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var btnIsTouched: (() -> Void)?
    
    func configure(model: Reminder) {
        dateLabel.text = model.dateLimit.formatToLongFormatWithHour(date: model.dateLimit)
        
        let image = model.isCompleted ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
        buttonView.setBackgroundImage(image, for: .normal)
        
        // Configura o título com ou sem strikethrough e cor
        if model.isCompleted {
            let attributedText = NSAttributedString(
                string: model.title,
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.gray
                ]
            )
            containerView.backgroundColor = UIColor.systemGray5
            titleLabel.attributedText = attributedText
        } else {
            let attributedText = NSAttributedString(
                string: model.title,
                attributes: [
                    .foregroundColor: UIColor.black
                ]
            )
            containerView.backgroundColor = .white
            titleLabel.attributedText = attributedText
        }
    }
}

// MARK: - ViewCode
extension ReminderCell: ViewCode {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(buttonView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(dateLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Define um espaçamento menor entre as células
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            // Ajusta o tamanho e a posição do botão para mantê-lo circular e centralizado
            buttonView.widthAnchor.constraint(equalToConstant: 40),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            buttonView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            buttonView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            // Centraliza o titleLabel verticalmente e o alinha à direita do botão
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: buttonView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            // Coloca o dateLabel logo abaixo do titleLabel e o alinha à direita
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func applyAdditionalChanges() {}
}

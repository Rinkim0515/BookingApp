//
//  BookDetailView.swift
//  BookingApp
//
//  Created by bloom on 8/2/24.
//

import UIKit
import Kingfisher
import SnapKit


protocol DetailBookViewControllerDelegate: AnyObject {
  func didCompleteSave(bookName: String)
}
class DetailBookViewController: UIViewController {
  var selectedItem: Book?
  weak var delegate: (any DetailBookViewControllerDelegate)?
  
  let scrollView = UIScrollView()
  let verticalStackView = UIStackView()
  let contentsView = UIView()
  let titlelabel = UILabel()
  let authorLabel = UILabel()
  let bookImagelabel  = UIImageView()
  let priceLabel = UILabel()
  var overviewLabel = UILabel()
  let buttonStackView = UIStackView()
  lazy var closeButton = UIButton()
  lazy var saveButton = UIButton()
    
  
  override func viewDidLoad() {
    view.backgroundColor = .white
    self.configureUI()
    self.makeConstraints()
  }
  
  func configureUI(){
    
    guard let selectedItem = self.selectedItem else { return }
    titlelabel.text = selectedItem.title
    authorLabel.text = selectedItem.authors.joined(separator: ",")
    priceLabel.text = "\(selectedItem.price)원"
    overviewLabel.text = selectedItem.contents
    bookImagelabel.kf.setImage(with: URL(string: selectedItem.thumbnail))
    
    closeButton.addTarget(self, action: #selector(close), for: .touchDown)
    saveButton.addTarget(self, action: #selector(save), for: .touchDown)
    
    [
      scrollView,
      buttonStackView
    ].forEach{ self.view.addSubview($0)}
    self.scrollView.addSubview(contentsView)
    self.contentsView.addSubview(verticalStackView)
    [
      titlelabel,
      authorLabel,
      bookImagelabel,
      priceLabel,
      overviewLabel,
    ].forEach{ self.verticalStackView.addArrangedSubview($0)}
    [
      closeButton,
      saveButton
    ].forEach{ self.buttonStackView.addArrangedSubview($0)}
    
    verticalStackView.axis = .vertical
    verticalStackView.spacing = 20
    titlelabel.textAlignment = .center
    titlelabel.font = .systemFont(ofSize: 30, weight: .bold)
    authorLabel.textAlignment = .center
    authorLabel.font = .systemFont(ofSize: 16, weight: .bold)
    authorLabel.textColor = .systemGray
    bookImagelabel.contentMode = .scaleAspectFit
    priceLabel.textAlignment = .center
    priceLabel.font = .systemFont(ofSize: 16, weight: .regular)
    overviewLabel.numberOfLines = 0
    buttonStackView.axis = .horizontal
    buttonStackView.spacing = 10
    closeButton.setTitle("X", for: .normal)
    closeButton.backgroundColor = .systemGray
    closeButton.layer.cornerRadius = 10
    saveButton.setTitle("담기", for: .normal)
    saveButton.backgroundColor = .systemGray
    saveButton.layer.cornerRadius = 10
    
  }
  
  private func makeConstraints(){
    self.scrollView.snp.makeConstraints{
      $0.top.trailing.leading.equalTo(self.view.safeAreaLayoutGuide)
      $0.bottom.equalTo(self.buttonStackView.snp.top).offset(-10)
    }
    self.scrollView.contentLayoutGuide.snp.makeConstraints{
      $0.edges.equalTo(self.contentsView)
    }
    self.contentsView.snp.makeConstraints{
      $0.width.equalTo(self.scrollView.frameLayoutGuide)
    }
    self.verticalStackView.snp.makeConstraints{
      $0.verticalEdges.equalToSuperview().inset(20)
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    self.buttonStackView.snp.makeConstraints{
      $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
    self.bookImagelabel.snp.makeConstraints{
      $0.size.equalTo(250)
    }
    self.closeButton.snp.makeConstraints{
      $0.width.equalTo(self.saveButton).multipliedBy(0.5)
      $0.height.equalTo(50)
    }
    self.saveButton.snp.makeConstraints{
      $0.height.equalTo(50)
    }

  }
  

  
  @objc func close(){
    self.dismiss(animated: true)
  }
  @objc func save(){
    self.delegate?.didCompleteSave(bookName: selectedItem?.title ?? "")
  }
  
  
}

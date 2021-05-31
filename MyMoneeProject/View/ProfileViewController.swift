//
//  ProfileViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit
import Photos
import Kingfisher

class ProfileViewController: UIViewController {

    @IBOutlet weak var editSaveBtn: UIButton!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var editPhoto: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var editName: UIImageView!
    @IBOutlet weak var profileText: UILabel!
    @IBOutlet weak var tapPhoto: UIView!
    @IBOutlet weak var tapName: UIView!
    
    var pickImage = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editSaveBtn.setTitle("Edit", for: .normal)
        profilePhoto.image = UIImage(named: users[0].displayPicture ?? "")
//
//        profilePhoto.kf.setImage(with: URL(string: "https://www.pngitem.com/pimgs/m/161-1613980_arthur-morgan-png-download-red-dead-redemption-2.png"))
        editPhoto.isHidden = true
        editName.isHidden = true
        profileName.text = users[0].name
        if wallets[0].totalMoneyIn ?? 0 <  wallets[0].totalMoneyOut ?? 0 {
            profileText.text = "Sayang sekali, manajemen keuanganmu masih belum baik"
        } else {
            profileText.text = "Bagus! Pengeluaranmu lebih sedikit dari Pemasukan"
        }
        
        tapPhoto.isUserInteractionEnabled = false
        tapName.isUserInteractionEnabled = false
    }

    @IBAction func editAction(_ sender: UIButton) {
        
        if editSaveBtn.titleLabel?.text == "Edit" {
            editSaveBtn.setTitle("Selesai", for: .normal)
            editPhoto.isHidden = false
            editName.isHidden = false
            tapPhoto.isUserInteractionEnabled = true
            tapName.isUserInteractionEnabled = true
        } else {
            editSaveBtn.setTitle("Edit", for: .normal)
            editPhoto.isHidden = true
            editName.isHidden = true
            tapPhoto.isUserInteractionEnabled = false
            tapName.isUserInteractionEnabled = false
            
            let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)
            
            mainTabController.modalPresentationStyle = .fullScreen
            mainTabController.selectedIndex = 2
            present(mainTabController, animated: false, completion: nil)
        }
        
    }
    
    @IBAction func editNameAction(_ sender: UITapGestureRecognizer) {
        let editNameModal = UIAlertController(title: "Edit Nama", message: "Masukan nama Anda", preferredStyle: .alert)
        editNameModal.addTextField()
        editNameModal.textFields![0].placeholder = "Masukkan nama"
        editNameModal.textFields![0].text = users[0].name
        
        let tapUpdate = UIAlertAction(title: "OK", style: .default) { [self] (_) -> Void in
            users[0].name = editNameModal.textFields![0].text
            profileName.text = users[0].name
        }
        
        let tapCancel = UIAlertAction(title: "Batal", style: .cancel)
        
        editNameModal.addAction(tapUpdate);editNameModal.addAction(tapCancel)
        
        present(editNameModal, animated: true, completion: nil)
    }
    
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func editPhotoAction(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            pickImage.delegate = self
            pickImage.sourceType = .photoLibrary
            pickImage.allowsEditing = false
            present(pickImage, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profilePhoto.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

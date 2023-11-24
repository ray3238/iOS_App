import UIKit
import SnapKit
import Then


class ImagePickerViewController: UIViewController {
    
    
    // MARK: 이것들의 쓰임새는 뭐임? ㅋㅋ;
//    let photoFrame: UIImageView! = nil
//    let photoAlbumText:UILabel! = nil
    
    let imagePickerController = UIImagePickerController()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "house")
        return imageView
    }()
    private let button = UIButton().then {
        $0.setTitle("사진 불러오기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        imagePickerController.delegate = self
        view.addSubview(button)
        view.addSubview(photoImageView)
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        photoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(button).inset(60)
            $0.height.equalTo(200)
            $0.width.equalTo(200)
        }
        
        self.button.addTarget(self, action: #selector(self.albumAuth), for: .touchUpInside)
    }
    
    @objc func albumAuth() {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func imagePickerClickedButton(_ sender: UIButton) {
        self.button.addTarget(self, action: #selector(self.albumAuth), for: .touchUpInside)
    }
}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] {
            photoImageView.image = image as! UIImage
        }
        dismiss(animated: true, completion: nil)
    }
}

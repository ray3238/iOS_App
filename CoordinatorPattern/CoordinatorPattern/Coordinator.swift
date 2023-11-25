import UIKit

class Coordinator {
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = FirstViewController()
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: false)
    }

    func goToFirstScreen() {
        let viewController = FirstViewController()
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToSecondScreen() {
        let viewController = SecondViewController()
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func goToThirdScreen() {
        let viewController = ThirdViewController()
        viewController.coordinator = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

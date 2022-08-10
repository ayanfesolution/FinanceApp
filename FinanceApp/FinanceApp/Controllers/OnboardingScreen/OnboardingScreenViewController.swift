//
//  OnboardingScreenViewController.swift
//  FinanceApp
//
//  Created by Decagon on 10/08/2022.
//

import UIKit

class OnboardingScreenViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var currentlyShowingIndex = 0
    // MARK: - Override the default page crul transistion styling.
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
            super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            print("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpControllerViews()
    }
    private func setUpControllerViews() {
        self.dataSource = self
        self.delegate = self
        let screenOne = ScreenOneViewController()
        screenOne.skipButton.addTarget(self, action: #selector(nextButtonAction1), for: .touchUpInside)
        let screenTwo = ScreenTwoViewController()
        screenTwo.skipButton.addTarget(self, action: #selector(nextButtonAction2), for: .touchUpInside)
        screenTwo.backButton.addTarget(self, action: #selector(nextButtonAction0), for: .touchUpInside)
        let screenThree = ScreenThreeViewController()
        screenThree.backButton.addTarget(self, action: #selector(nextButtonAction1), for: .touchUpInside)
        screenThree.startButton.addTarget(self, action: #selector(moveToWelcomeScreen), for: .touchUpInside)
        pages.append(screenOne)
        pages.append(screenTwo)
        pages.append(screenThree)
        setViewControllers([pages[currentlyShowingIndex]], direction: .forward, animated: false)
        
        // pageControl
             self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = .white
             self.pageControl.pageIndicatorTintColor = UIColor.lightGray
             self.pageControl.numberOfPages = self.pages.count
             self.pageControl.currentPage = currentlyShowingIndex
             self.view.addSubview(self.pageControl)

             self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
             self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
             self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
             self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    
    
    @objc func nextButtonAction1() {
        setViewControllers([pages[1]], direction: .forward, animated: false, completion: nil)
    }
    @objc func nextButtonAction2() {
        setViewControllers([pages[2]], direction: .forward, animated: false, completion: nil)
    }
    
    @objc func nextButtonAction0() {
        setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
    }
    
    @objc func moveToWelcomeScreen() {
        let nextScreen = WelcomePageViewController()
        nextScreen.modalPresentationStyle = .fullScreen
        present(nextScreen, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
                return nil
            }
            let previousIndex = viewControllerIndex - 1
            guard previousIndex >= 0 else {
                return nil
            }
            guard pages.count > previousIndex else {
                return nil
            }
            currentlyShowingIndex -= 1
            return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = pages.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        currentlyShowingIndex += 1
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
    }

}

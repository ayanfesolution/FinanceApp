//
//  OnboardingScreenViewController.swift
//  FinanceApp
//
//  Created by Decagon on 10/08/2022.
//

import UIKit

class OnboardingScreenViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pages = [UIViewController]()
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
        let screenOne = ScreenOneViewController()
//        screenOne.nextButton.addTarget(self, action: #selector(nextButtonAction1), for: .touchUpInside)
        let screenTwo = ScreenTwoViewController()
//        screenTwo.nextButton.addTarget(self, action: #selector(nextButtonAction2), for: .touchUpInside)
        let screenThree = ScreenThreeViewController()
        pages.append(screenOne)
        pages.append(screenTwo)
        pages.append(screenThree)
        setViewControllers([pages[currentlyShowingIndex]], direction: .forward, animated: false)
    }
    @objc func nextButtonAction1() {
        setViewControllers([pages[1]], direction: .forward, animated: false, completion: nil)
    }
    @objc func nextButtonAction2() {
        setViewControllers([pages[2]], direction: .forward, animated: false, completion: nil)
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

}

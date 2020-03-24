//
//  ViewController.swift
//  AppMonet Bidder IOS Sample App
//
//  Created by Jose Portocarrero on 3/12/20.
//  Copyright © 2020 Monet. All rights reserved.
//

import UIKit
import AppMonet_Bidder

class ViewController: UIViewController, AMBannerAdDelegate, AMInterstitialAdControllerDelegate {
    @IBOutlet weak var mrectContainer: UIView!
    // AppMonet Ad View
    var adView = AMAppMonetAdView(adUnitId: "b03e6dccfe9e4abab02470a39c88d5dc", size: MONET_MEDIUM_RECT_SIZE)
    // AppMonet Interstitial
    var interstitial = AMInterstitialAdController.init(forAdUnitId: "a49430ee57ee4401a9eda6098726ce54")

    // MARK: LifeCycle

    override func viewDidLoad() {
        // AppMonet Ad View Setup
        self.adView?.delegate = self;
        self.adView?.frame = CGRect(x: 0,
                y: 0,
                width: MONET_MEDIUM_RECT_SIZE.width,
                height: MONET_MEDIUM_RECT_SIZE.height)
        self.mrectContainer.addSubview(self.adView!)

        //Interstitial Setup
        interstitial?.delegate = self

        super.viewDidLoad()
    }

    // Mark: AMInterstitialAdControllerDelegate

    func interstitialDidLoadAd(_ interstitial: AMInterstitialAdController!) {
        showToast(controller: self, message: "Interstitial Loaded", seconds: 1)
    }

    func interstitialDidFail(toLoadAd interstitial: AMInterstitialAdController!, withError error: Error!) {
        showToast(controller: self, message: "Interstitial Failed", seconds: 1)
    }

    func interstitialWillAppear(_ interstitial: AMInterstitialAdController!) {
        NSLog("Interstitial will appear")
    }

    // Mark: AMBannerAdDelegate

    func wasClicked(_ adView: AMAppMonetAdView!) {
        showToast(controller: self, message: "Ad Clicked", seconds: 1)
    }

    func adLoaded(_ adView: AMAppMonetAdView!) {
        showToast(controller: self, message: "Ad Loaded", seconds: 1)
    }

    func adError(_ error: Error!, with adView: AMAppMonetAdView!) {
        showToast(controller: self, message: "Ad Failed", seconds: 1)
    }

    // MARK: Buttons

    @IBAction func loadMrect(_ sender: Any) {
        self.adView?.loadAd()
    }

    @IBAction func loadInterstitial(_ sender: Any) {
        interstitial?.loadAd()
    }

    @IBAction func showInterstitial(_ sender: Any) {
        if (interstitial!.ready) {
            interstitial?.show(from: self)
        } else {
            showToast(controller: self, message: "Interstitial Not Ready", seconds: 1)
        }
    }

    // MARK: Private

    private func showToast(controller: UIViewController, message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15

        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}


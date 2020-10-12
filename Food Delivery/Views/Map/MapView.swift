//
//  MapView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 07.10.2020.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var companies: [Company]
    @Binding var isActive: Bool
    @Binding var company: Company?
    @EnvironmentObject var settings: SheetManager
    
    func show(company: Company) {
        self.company = company
        settings.showPartialSheet {
            CompanyShortDetails(isActive: $isActive, company: company)
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self, controlFunc: show)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        view.removeAnnotations(view.annotations)
        
        for company in self.companies {
            let annotation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 10..<50), longitude: Double.random(in: 1..<2)))
            annotation.title = company.name
            annotation.subtitle = company.name
            annotation.imageName = company.imageName
            annotation.company = company
            
            view.addAnnotation(annotation)
        }
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    @EnvironmentObject var sheetManager: SheetManager
    
    var mapView: MapView
    var controlFunc: (Company) -> Void
    
    init(_ control: MapView, controlFunc: @escaping (Company) -> Void) {
        self.mapView = control
        self.controlFunc = controlFunc
    }
    
    func getPinImage(with logo: UIImage) -> UIImage {
        let pinImage = UIImage(named: "pin")
        
        let pinImageWidth: CGFloat = 50
        let pinImageHeight: CGFloat = pinImageWidth * 1.17
        
        let logoWidth: CGFloat = 35
        
        let renderFormat = UIGraphicsImageRendererFormat.default()
        renderFormat.opaque = false
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: pinImageWidth, height: 2 * pinImageHeight), format: renderFormat)
        
        let newImage = renderer.image {
            (context) in
            pinImage!.draw(in: CGRect(x: 0, y: 0, width: pinImageWidth, height: pinImageHeight))
            
            logo.draw(in: CGRect(x: (pinImageWidth - logoWidth) / 2, y: (pinImageWidth - logoWidth - 6) / 2, width: 35, height: 35))
        }
        
        return newImage
    }
    
    /// The map view asks `mapView(_:viewFor:)` for an appropiate annotation view for a specific annotation.
    /// - Tag: CreateAnnotationViews
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 100)
        
        if let annotation = annotation as? CustomAnnotation {
            let logo = UIImage(named: "\(annotation.imageName!)_logo")
            
            let imageView = UIImageView()
            imageView.image = logo
            imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
            imageView.backgroundColor = .white
            
            view.leftCalloutAccessoryView = imageView
            
            let button = CustomButton(company: annotation.company!)
            
            
            button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
            view.rightCalloutAccessoryView = button
            
            //            view.canShowCallout = true
            
            let pinImage = getPinImage(with: logo!)
            view.image = pinImage
            
            
        }
        
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation as? CustomAnnotation {
            controlFunc(annotation.company!)
        }
    }
    
    @objc func navigate(sender: CustomButton) {
        mapView.isActive = true
        mapView.company = sender.company
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
    
    // This property must be key-value observable, which the `@objc dynamic` attributes provide.
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    var imageName: String?
    var company: Company?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}

class CustomButton: UIButton {
    var company: Company
    
    init(company: Company) {
        self.company = company
        
        super.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        self.titleLabel?.text = "Info"
        self.titleLabel?.textColor = .black
        
        self.setImage(UIImage(systemName: "info.circle"), for: .normal)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

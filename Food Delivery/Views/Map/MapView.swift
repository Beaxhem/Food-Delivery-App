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
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.delegate = context.coordinator
        
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Capital of England"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        //mapView.removeAnnotations(mapView.annotations)
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
      var mapView: MapView
        
      init(_ control: MapView) {
          self.mapView = control
      }
        
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Tapped")
    }
    
    func getPinImage(with logo: UIImage) -> UIImage {
        let pinImage = UIImage(named: "pin-1")
        
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
        
        let logo = UIImage(named: "mcdonalds")
        
        let imageView = UIImageView()
        imageView.image = logo
        imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        imageView.backgroundColor = .white
        
        view.leftCalloutAccessoryView = imageView
        
        let button = UIButton(type: .detailDisclosure)
        view.rightCalloutAccessoryView = button
        
        view.canShowCallout = true
        
        let pinImage = getPinImage(with: logo!)
        view.image = pinImage
    
        return view
    }
}

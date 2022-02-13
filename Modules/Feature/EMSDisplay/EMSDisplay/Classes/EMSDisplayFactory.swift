//
//  EMSDisplayFactory.swift
//  EMSDisplay
//
//  Created by Aitor Salvador on 10/02/22.
//

public enum EMSDisplayFactory {
    public static func buildDashboard() -> UIViewController {
        DashboardFactory.buildScene()
    }
}

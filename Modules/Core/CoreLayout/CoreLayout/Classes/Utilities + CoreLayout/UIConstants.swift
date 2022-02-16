//
//  UIConstants.swift
//  
//
//  Created by Aitor Salvador García on 10/7/21.
//

public enum UIConstants {
    public static let spacing2: CGFloat = 2
    public static let spacing4: CGFloat = 4
    public static let spacing6: CGFloat = 6
    public static let spacing8: CGFloat = 8
    public static let spacing10: CGFloat = 10
    public static let spacing12: CGFloat = 12
    public static let spacing14: CGFloat = 14
    public static let spacing16: CGFloat = 16
    public static let spacing18: CGFloat = 18
    public static let spacing20: CGFloat = 20
    public static let spacing24: CGFloat = 24
    public static let spacing30: CGFloat = 30
    public static let spacing40: CGFloat = 40
    public static let spacing50: CGFloat = 50
    public static let spacing70: CGFloat = 70
    public static let spacing100: CGFloat = 20
    
    public static let hMargin: CGFloat = spacing20

    public static let lineWidth: CGFloat = 1
    public static let textInputPadding: CGFloat = 10
}

public extension UIConstants {
    enum Animation {
        public static let duration1_5: Double = 0.15
        public static let duration0_2: Double = 0.2
        public static let duration3: Double = 3
    }
}

public extension UIConstants {
    enum Radius {
        public static let radius4: CGFloat = 4
        public static let radius10: CGFloat = 10
        public static let radius16: CGFloat = 16
    }
}

public extension UIConstants {
    enum Size {
        public static let squared16: CGSize = .squared(16)
        public static let squared20: CGSize = .squared(20)
        public static let squared24: CGSize = .squared(24)
        public static let squared28: CGSize = .squared(28)
        public static let squared36: CGSize = .squared(36)
        public static let squared50: CGSize = .squared(50)
        public static let squared60: CGSize = .squared(60)
        public static let squared80: CGSize = .squared(80)
        public static let squared120: CGSize = .squared(120)
    }
}

public extension UIConstants {
    enum Measure {
        public static let height40: CGFloat = 40
        public static let height70: CGFloat = 70
        public static let width390: CGFloat = 390
    }
}

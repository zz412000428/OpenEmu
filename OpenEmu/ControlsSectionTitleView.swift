// Copyright (c) 2020, OpenEmu Team
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the OpenEmu Team nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY OpenEmu Team ''AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL OpenEmu Team BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Cocoa

@objc(OEControlsSectionTitleView)
class ControlsSectionTitleView: NSView {
    
    private let leftGap: CGFloat = 16
    
    @objc var stringValue = ""
    
    let visualEffectView: NSVisualEffectView = NSVisualEffectView()
    
    let imageView: NSImageView = {
        let imageView = NSImageView(image: NSImage(named: "controls_bg")!)
        imageView.imageScaling = .scaleAxesIndependently
        return imageView
    }()
    
    let textField: NSTextField = {
        let textField = NSTextField(labelWithString: "")
        textField.font = .boldSystemFont(ofSize: 11)
        textField.textColor = .labelColor
        return textField
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    func commonInit() {
        
        addSubview(visualEffectView)
        addSubview(imageView)
        addSubview(textField)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        visualEffectView.frame = bounds
        imageView.frame = bounds
        textField.stringValue = stringValue
        textField.frame = titleRect
    }
    
    private var titleRect: NSRect {
        var rect = bounds
        
        rect.origin.y -= (rect.size.height-textField.attributedStringValue.size().height)/2
        rect.origin.x += leftGap
        
        return backingAlignedRect(rect, options: .alignAllEdgesNearest)
    }
}

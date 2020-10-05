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
    
    private lazy var string = NSAttributedString(string: stringValue, attributes: ControlsSectionTitleView.attributes)
    
    @objc var stringValue = ""
    
    override func draw(_ dirtyRect: NSRect) {
        
        NSImage(named: "controls_bg")?.draw(in: dirtyRect)
        string.draw(in: titleRect)
    }
    
    private var titleRect: NSRect {
        var rect = bounds
        
        rect.origin.y -= (rect.size.height-string.size().height)/2
        rect.origin.x += leftGap
        
        return backingAlignedRect(rect, options: .alignAllEdgesNearest)
    }
    
    private static let attributes: [NSAttributedString.Key : Any]? = {
        let font = NSFont.boldSystemFont(ofSize: 11)
        let color = NSColor.labelColor
        
        let attributes: [NSAttributedString.Key : Any] =
                                          [.font: font,
                                .foregroundColor: color]
        
        return attributes
    }()
}

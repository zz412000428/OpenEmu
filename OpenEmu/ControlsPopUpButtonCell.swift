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

@objc(OEControlsPopUpButtonCell)
final class ControlsPopUpButtonCell: NSPopUpButtonCell {
    
    override func drawImage(_ image: NSImage, withFrame frame: NSRect, in controlView: NSView) {
        image.draw(in: frame)
    }
    
    override func titleRect(forBounds cellFrame: NSRect) -> NSRect {
        if #available(macOS 10.16, *) {
            return super.titleRect(forBounds: cellFrame)
        }
        var rect = super.titleRect(forBounds: cellFrame)
        rect.origin.y -= 2
        return rect
    }
    
    override func drawInterior(withFrame cellFrame: NSRect, in controlView: NSView) {
        if #available(macOS 10.16, *) {
            return super.drawInterior(withFrame: cellFrame, in: controlView)
        }
        let textRect = titleRect(forBounds: cellFrame)
        let imageRect = self.imageRect(forBounds: cellFrame)

        if !textRect.isEmpty {
            let attributedTitle = NSAttributedString(string: title, attributes: ControlsPopUpButtonCell.attributes)
            drawTitle(attributedTitle, withFrame: textRect, in: controlView)
        }
        if !imageRect.isEmpty,
           let image = image {
            drawImage(image, withFrame: imageRect, in: controlView)
        }
    }
    
    private static let attributes: [NSAttributedString.Key : Any] = {
        
        let font = NSFont.systemFont(ofSize: 13)
        let color = NSColor.labelColor
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byTruncatingTail
        
        let attributes: [NSAttributedString.Key : Any] =
                                          [.font: font,
                                .foregroundColor: color,
                                 .paragraphStyle: style,
                                 .baselineOffset: -2]
        
        return attributes
    }()
}

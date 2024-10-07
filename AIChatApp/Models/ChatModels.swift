//
//  ChatModels.swift
//  AIChatApp
//
//  Created by Weijia Huang on 10/7/24.
//

import Foundation
import MessageKit

struct Message: MessageType {
    public var sender: any MessageKit.SenderType
    public var messageId: String
    public var sentDate: Date
    public var kind: MessageKind
}

extension MessageKind{
    var messageKindString:String{
        switch self{
            
        case .text(_):
            return "text"
        case .attributedText(_):
            return "attributedText"
        case .photo(_):
            return "photo"
        case .video(_):
            return "video"
        case .location(_):
            return "location"
        case .emoji(_):
            return "emoji"
        case .audio(_):
            return "audio"
        case .contact(_):
            return "contact"
        case .linkPreview(_):
            return "linkPreview"
        case .custom(_):
            return "custom"
        }
    }
    
}

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}

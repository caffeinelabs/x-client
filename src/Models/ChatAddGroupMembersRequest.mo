
import { type ChatActionSignature; JSON = ChatActionSignature } "./ChatActionSignature";

import { type ChatConversationParticipantKey; JSON = ChatConversationParticipantKey } "./ChatConversationParticipantKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatAddGroupMembersRequest.mo

module {
    public type ChatAddGroupMembersRequest = {
        /// Cryptographic signatures for the add-members action.
        action_signatures : ?[ChatActionSignature];
        /// Version of the new rotated conversation key.
        conversation_key_version : ?Text;
        /// Encrypted conversation keys for each new participant after key rotation.
        conversation_participant_keys : ?[ChatConversationParticipantKey];
        /// Re-encrypted group avatar URL with new conversation key.
        encrypted_avatar_url : ?Text;
        /// Re-encrypted group title with new conversation key.
        encrypted_title : ?Text;
        /// List of user IDs to add to the group conversation.
        user_ids : [Text];
    };

    public module JSON {
        public func toCandidValue(value : ChatAddGroupMembersRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.action_signatures) {
                case (?v__) List.add(buf, ("action_signatures", #Array(Array.map<ChatActionSignature, Candid.Candid>(v__, ChatActionSignature.toCandidValue))));
                case null ();
            };
            switch (value.conversation_key_version) {
                case (?v__) List.add(buf, ("conversation_key_version", #Text(v__)));
                case null ();
            };
            switch (value.conversation_participant_keys) {
                case (?v__) List.add(buf, ("conversation_participant_keys", #Array(Array.map<ChatConversationParticipantKey, Candid.Candid>(v__, ChatConversationParticipantKey.toCandidValue))));
                case null ();
            };
            switch (value.encrypted_avatar_url) {
                case (?v__) List.add(buf, ("encrypted_avatar_url", #Text(v__)));
                case null ();
            };
            switch (value.encrypted_title) {
                case (?v__) List.add(buf, ("encrypted_title", #Text(v__)));
                case null ();
            };
            List.add(buf, ("user_ids", #Array(Array.map<Text, Candid.Candid>(value.user_ids, func(s : Text) : Candid.Candid = #Text(s)))));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddGroupMembersRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let action_signatures : ?[ChatActionSignature] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "action_signatures")) {
                        case (?action_signatures_field) ((switch (action_signatures_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatActionSignature>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatActionSignature.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let conversation_key_version : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_version")) {
                        case (?conversation_key_version_field) ((switch (conversation_key_version_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let conversation_participant_keys : ?[ChatConversationParticipantKey] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_participant_keys")) {
                        case (?conversation_participant_keys_field) ((switch (conversation_participant_keys_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<ChatConversationParticipantKey>();
                            for (c__ in xs__.values()) {
                                let ?m__ = ChatConversationParticipantKey.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let encrypted_avatar_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encrypted_avatar_url")) {
                        case (?encrypted_avatar_url_field) ((switch (encrypted_avatar_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let encrypted_title : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "encrypted_title")) {
                        case (?encrypted_title_field) ((switch (encrypted_title_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?user_ids_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "user_ids") else return null;
                    let ?user_ids = ((switch (user_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    ?{
                        action_signatures;
                        conversation_key_version;
                        conversation_participant_keys;
                        encrypted_avatar_url;
                        encrypted_title;
                        user_ids;
                    };
                };
                case _ null;
            };
    };
};

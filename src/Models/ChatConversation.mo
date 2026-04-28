/// A Chat conversation resource representing either a direct or group conversation.

import { type ChatConversationType; JSON = ChatConversationType } "./ChatConversationType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatConversation.mo

module {
    public type ChatConversation = {
        /// User IDs of group admins. Only present for group conversations.
        admin_ids : ?[Text];
        /// ISO 8601 timestamp when the group was created. Only present for group conversations.
        created_at : ?Text;
        /// URL for the group avatar. Only present for group conversations.
        group_avatar_url : ?Text;
        /// Encrypted group name. Only present for group conversations.
        group_name : ?Text;
        /// The unique identifier for this conversation.
        id : Text;
        /// Whether notifications are muted for this conversation.
        is_muted : ?Bool;
        /// User IDs of group members. Only present for group conversations.
        member_ids : ?[Text];
        /// Message time-to-live in milliseconds.
        message_ttl_msec : ?Text;
        /// Array of user IDs who are participants in this conversation.
        participant_ids : ?[Text];
        /// Whether screen capture blocking is enabled for this conversation.
        screen_capture_blocking_enabled : ?Bool;
        /// Whether screen capture detection is enabled for this conversation.
        screen_capture_detection_enabled : ?Bool;
        type_ : ?ChatConversationType;
        /// ISO 8601 timestamp when the group was last updated. Only present for group conversations.
        updated_at : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatConversation) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.admin_ids) {
                case (?v__) List.add(buf, ("admin_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.created_at) {
                case (?v__) List.add(buf, ("created_at", #Text(v__)));
                case null ();
            };
            switch (value.group_avatar_url) {
                case (?v__) List.add(buf, ("group_avatar_url", #Text(v__)));
                case null ();
            };
            switch (value.group_name) {
                case (?v__) List.add(buf, ("group_name", #Text(v__)));
                case null ();
            };
            List.add(buf, ("id", #Text(value.id)));
            switch (value.is_muted) {
                case (?v__) List.add(buf, ("is_muted", #Bool(v__)));
                case null ();
            };
            switch (value.member_ids) {
                case (?v__) List.add(buf, ("member_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.message_ttl_msec) {
                case (?v__) List.add(buf, ("message_ttl_msec", #Text(v__)));
                case null ();
            };
            switch (value.participant_ids) {
                case (?v__) List.add(buf, ("participant_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.screen_capture_blocking_enabled) {
                case (?v__) List.add(buf, ("screen_capture_blocking_enabled", #Bool(v__)));
                case null ();
            };
            switch (value.screen_capture_detection_enabled) {
                case (?v__) List.add(buf, ("screen_capture_detection_enabled", #Bool(v__)));
                case null ();
            };
            switch (value.type_) {
                case (?v__) List.add(buf, ("type", ChatConversationType.toCandidValue(v__)));
                case null ();
            };
            switch (value.updated_at) {
                case (?v__) List.add(buf, ("updated_at", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatConversation =
            switch (candid) {
                case (#Record(fields)) {
                    let admin_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "admin_ids")) {
                        case (?admin_ids_field) ((switch (admin_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let created_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "created_at")) {
                        case (?created_at_field) ((switch (created_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let group_avatar_url : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_avatar_url")) {
                        case (?group_avatar_url_field) ((switch (group_avatar_url_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let group_name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "group_name")) {
                        case (?group_name_field) ((switch (group_name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let ?id_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id") else return null;
                    let ?id = ((switch (id_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let is_muted : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "is_muted")) {
                        case (?is_muted_field) ((switch (is_muted_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let member_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "member_ids")) {
                        case (?member_ids_field) ((switch (member_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let message_ttl_msec : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "message_ttl_msec")) {
                        case (?message_ttl_msec_field) ((switch (message_ttl_msec_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let participant_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "participant_ids")) {
                        case (?participant_ids_field) ((switch (participant_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let screen_capture_blocking_enabled : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "screen_capture_blocking_enabled")) {
                        case (?screen_capture_blocking_enabled_field) ((switch (screen_capture_blocking_enabled_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let screen_capture_detection_enabled : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "screen_capture_detection_enabled")) {
                        case (?screen_capture_detection_enabled_field) ((switch (screen_capture_detection_enabled_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let type_ : ?ChatConversationType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type")) {
                        case (?type__field) (ChatConversationType.fromCandidValue(type__field.1));
                        case null null;
                    };
                    let updated_at : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "updated_at")) {
                        case (?updated_at_field) ((switch (updated_at_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        admin_ids;
                        created_at;
                        group_avatar_url;
                        group_name;
                        id;
                        is_muted;
                        member_ids;
                        message_ttl_msec;
                        participant_ids;
                        screen_capture_blocking_enabled;
                        screen_capture_detection_enabled;
                        type_;
                        updated_at;
                    };
                };
                case _ null;
            };
    };
};


import { type DmMediaAttachment; JSON = DmMediaAttachment } "./DmMediaAttachment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateTextMessageRequest.mo

module {
    public type CreateTextMessageRequest = {
        /// Attachments to a DM Event.
        attachments : ?[DmMediaAttachment];
        /// Text of the message.
        text_ : Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateTextMessageRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.attachments) {
                case (?v__) List.add(buf, ("attachments", #Array(Array.map<DmMediaAttachment, Candid.Candid>(v__, DmMediaAttachment.toCandidValue))));
                case null ();
            };
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateTextMessageRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let attachments : ?[DmMediaAttachment] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "attachments")) {
                        case (?attachments_field) ((switch (attachments_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<DmMediaAttachment>();
                            for (c__ in xs__.values()) {
                                let ?m__ = DmMediaAttachment.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let ?text__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text") else return null;
                    let ?text_ = ((switch (text__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        attachments;
                        text_;
                    };
                };
                case _ null;
            };
    };
};

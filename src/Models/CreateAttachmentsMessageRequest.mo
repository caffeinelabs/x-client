
import { type DmMediaAttachment; JSON = DmMediaAttachment } "./DmMediaAttachment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateAttachmentsMessageRequest.mo

module {
    public type CreateAttachmentsMessageRequest = {
        /// Attachments to a DM Event.
        attachments : [DmMediaAttachment];
        /// Text of the message.
        text_ : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : CreateAttachmentsMessageRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("attachments", #Array(Array.map<DmMediaAttachment, Candid.Candid>(value.attachments, DmMediaAttachment.toCandidValue))));
            switch (value.text_) {
                case (?v__) List.add(buf, ("text", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateAttachmentsMessageRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let ?attachments_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "attachments") else return null;
                    let ?attachments = ((switch (attachments_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<DmMediaAttachment>();
                            for (c__ in xs__.values()) {
                                let ?m__ = DmMediaAttachment.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    })) else return null;
                    let text_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "text")) {
                        case (?text__field) ((switch (text__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        attachments;
                        text_;
                    };
                };
                case _ null;
            };
    };
};

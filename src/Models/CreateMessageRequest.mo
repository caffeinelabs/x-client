
import { type CreateAttachmentsMessageRequest; JSON = CreateAttachmentsMessageRequest } "./CreateAttachmentsMessageRequest";

import { type CreateTextMessageRequest; JSON = CreateTextMessageRequest } "./CreateTextMessageRequest";

import { type DmMediaAttachment; JSON = DmMediaAttachment } "./DmMediaAttachment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateMessageRequest.mo

module {
    /// The required-fields slice of CreateMessageRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Attachments to a DM Event.
        attachments : [DmMediaAttachment];
        /// Text of the message.
        text_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateMessageRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
    };

    public type CreateMessageRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateMessageRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateMessageRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateMessageRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateMessageRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateMessageRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            List.add(buf, ("attachments", #Array(Array.map<DmMediaAttachment, Candid.Candid>(value.attachments, DmMediaAttachment.toCandidValue))));
            List.add(buf, ("text", #Text(value.text_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateMessageRequest =
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

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};

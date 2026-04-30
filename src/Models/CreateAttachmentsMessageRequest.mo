
import { type DmMediaAttachment; JSON = DmMediaAttachment } "./DmMediaAttachment";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateAttachmentsMessageRequest.mo

module {
    /// The required-fields slice of CreateAttachmentsMessageRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        /// Attachments to a DM Event.
        attachments : [DmMediaAttachment];
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateAttachmentsMessageRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        text_ : ?Text;
    };

    public type CreateAttachmentsMessageRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateAttachmentsMessageRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateAttachmentsMessageRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateAttachmentsMessageRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateAttachmentsMessageRequest else Runtime.unreachable();
            res
        };

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

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};

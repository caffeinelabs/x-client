/// Specifies the type of attachments (if any) present in this DM.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// DmEventAttachments.mo

module {
    public type DmEventAttachments = {
        /// A list of card IDs (if cards are attached).
        card_ids : ?[Text];
        /// A list of Media Keys for each one of the media attachments (if media are attached).
        media_keys : ?[Text];
    };

    public module JSON {
        // `init` constructs a DmEventAttachments from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { DmEventAttachments.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : DmEventAttachments {
            let ?res = from_candid(to_candid(required)) : ?DmEventAttachments else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : DmEventAttachments) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.card_ids) {
                case (?v__) List.add(buf, ("card_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.media_keys) {
                case (?v__) List.add(buf, ("media_keys", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?DmEventAttachments =
            switch (candid) {
                case (#Record(fields)) {
                    let card_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "card_ids")) {
                        case (?card_ids_field) ((switch (card_ids_field.1) {
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
                    let media_keys : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_keys")) {
                        case (?media_keys_field) ((switch (media_keys_field.1) {
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
                    ?{
                        card_ids;
                        media_keys;
                    };
                };
                case _ null;
            };
    };
};

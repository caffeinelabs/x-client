
import { type MediaCategory; JSON = MediaCategory } "./MediaCategory";

import { type MediaUploadConfigRequestMediaType; JSON = MediaUploadConfigRequestMediaType } "./MediaUploadConfigRequestMediaType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";
import Int "mo:core/Int";

// MediaUploadConfigRequest.mo

module {
    public type MediaUploadConfigRequest = {
        additional_owners : ?[Text];
        media_category : ?MediaCategory;
        media_type : ?MediaUploadConfigRequestMediaType;
        /// Whether this media is shared or not.
        shared_ : ?Bool;
        /// The total size of the media upload in bytes.
        total_bytes : ?Nat;
    };

    public module JSON {
        // `init` constructs a MediaUploadConfigRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadConfigRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaUploadConfigRequest {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadConfigRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadConfigRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.additional_owners) {
                case (?v__) List.add(buf, ("additional_owners", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            switch (value.media_category) {
                case (?v__) List.add(buf, ("media_category", MediaCategory.toCandidValue(v__)));
                case null ();
            };
            switch (value.media_type) {
                case (?v__) List.add(buf, ("media_type", MediaUploadConfigRequestMediaType.toCandidValue(v__)));
                case null ();
            };
            switch (value.shared_) {
                case (?v__) List.add(buf, ("shared", #Bool(v__)));
                case null ();
            };
            switch (value.total_bytes) {
                case (?v__) List.add(buf, ("total_bytes", #Nat(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadConfigRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let additional_owners : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "additional_owners")) {
                        case (?additional_owners_field) ((switch (additional_owners_field.1) {
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
                    let media_category : ?MediaCategory = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_category")) {
                        case (?media_category_field) (MediaCategory.fromCandidValue(media_category_field.1));
                        case null null;
                    };
                    let media_type : ?MediaUploadConfigRequestMediaType = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_type")) {
                        case (?media_type_field) (MediaUploadConfigRequestMediaType.fromCandidValue(media_type_field.1));
                        case null null;
                    };
                    let shared_ : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "shared")) {
                        case (?shared__field) ((switch (shared__field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let total_bytes : ?Nat = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "total_bytes")) {
                        case (?total_bytes_field) ((switch (total_bytes_field.1) { case (#Nat(n)) ?n; case (#Int(i)) (if (i < 0) null else ?Int.abs(i)); case _ null }));
                        case null null;
                    };
                    ?{
                        additional_owners;
                        media_category;
                        media_type;
                        shared_;
                        total_bytes;
                    };
                };
                case _ null;
            };
    };
};

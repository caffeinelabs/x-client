
import { type ProcessingInfo; JSON = ProcessingInfo } "./ProcessingInfo";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// MediaUploadResponseData.mo

module {
    public type MediaUploadResponseData = {
        /// Number of seconds after which upload session expires.
        expires_after_secs : ?Int;
        /// The unique identifier of this Media.
        id : ?Text;
        /// The Media Key identifier for this attachment.
        media_key : ?Text;
        processing_info : ?ProcessingInfo;
        /// Size of the upload
        size : ?Int;
    };

    public module JSON {
        // `init` constructs a MediaUploadResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { MediaUploadResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : MediaUploadResponseData {
            let ?res = from_candid(to_candid(required)) : ?MediaUploadResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : MediaUploadResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.expires_after_secs) {
                case (?v__) List.add(buf, ("expires_after_secs", #Int(v__)));
                case null ();
            };
            switch (value.id) {
                case (?v__) List.add(buf, ("id", #Text(v__)));
                case null ();
            };
            switch (value.media_key) {
                case (?v__) List.add(buf, ("media_key", #Text(v__)));
                case null ();
            };
            switch (value.processing_info) {
                case (?v__) List.add(buf, ("processing_info", ProcessingInfo.toCandidValue(v__)));
                case null ();
            };
            switch (value.size) {
                case (?v__) List.add(buf, ("size", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?MediaUploadResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let expires_after_secs : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "expires_after_secs")) {
                        case (?expires_after_secs_field) ((switch (expires_after_secs_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "id")) {
                        case (?id_field) ((switch (id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let media_key : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "media_key")) {
                        case (?media_key_field) ((switch (media_key_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let processing_info : ?ProcessingInfo = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "processing_info")) {
                        case (?processing_info_field) (ProcessingInfo.fromCandidValue(processing_info_field.1));
                        case null null;
                    };
                    let size : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "size")) {
                        case (?size_field) ((switch (size_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        expires_after_secs;
                        id;
                        media_key;
                        processing_info;
                        size;
                    };
                };
                case _ null;
            };
    };
};

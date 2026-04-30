
import { type ChatAddPublicKeyRequestPublicKey; JSON = ChatAddPublicKeyRequestPublicKey } "./ChatAddPublicKeyRequestPublicKey";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatAddPublicKeyRequest.mo

module {
    /// The required-fields slice of ChatAddPublicKeyRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        public_key : ChatAddPublicKeyRequestPublicKey;
        /// Public key version.
        version : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ChatAddPublicKeyRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        generate_version : ?Bool;
    };

    public type ChatAddPublicKeyRequest = Required and Optional;

    public module JSON {
        // `init` constructs a ChatAddPublicKeyRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatAddPublicKeyRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ChatAddPublicKeyRequest {
            let ?res = from_candid(to_candid(required)) : ?ChatAddPublicKeyRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatAddPublicKeyRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.generate_version) {
                case (?v__) List.add(buf, ("generate_version", #Bool(v__)));
                case null ();
            };
            List.add(buf, ("public_key", ChatAddPublicKeyRequestPublicKey.toCandidValue(value.public_key)));
            List.add(buf, ("version", #Text(value.version)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddPublicKeyRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let generate_version : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "generate_version")) {
                        case (?generate_version_field) ((switch (generate_version_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let ?public_key_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "public_key") else return null;
                    let ?public_key = (ChatAddPublicKeyRequestPublicKey.fromCandidValue(public_key_field.1)) else return null;
                    let ?version_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "version") else return null;
                    let ?version = ((switch (version_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    ?{
                        generate_version;
                        public_key;
                        version;
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

/// A request to create a new batch compliance job.

import { type CreateComplianceJobRequestType; JSON = CreateComplianceJobRequestType } "./CreateComplianceJobRequestType";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// CreateComplianceJobRequest.mo

module {
    /// The required-fields slice of CreateComplianceJobRequest — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        type_ : CreateComplianceJobRequestType;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express CreateComplianceJobRequest as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        name : ?Text;
        resumable : ?Bool;
    };

    public type CreateComplianceJobRequest = Required and Optional;

    public module JSON {
        // `init` constructs a CreateComplianceJobRequest from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { CreateComplianceJobRequest.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : CreateComplianceJobRequest {
            let ?res = from_candid(to_candid(required)) : ?CreateComplianceJobRequest else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : CreateComplianceJobRequest) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.name) {
                case (?v__) List.add(buf, ("name", #Text(v__)));
                case null ();
            };
            switch (value.resumable) {
                case (?v__) List.add(buf, ("resumable", #Bool(v__)));
                case null ();
            };
            List.add(buf, ("type", CreateComplianceJobRequestType.toCandidValue(value.type_)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateComplianceJobRequest =
            switch (candid) {
                case (#Record(fields)) {
                    let name : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "name")) {
                        case (?name_field) ((switch (name_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let resumable : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "resumable")) {
                        case (?resumable_field) ((switch (resumable_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = (CreateComplianceJobRequestType.fromCandidValue(type__field.1)) else return null;
                    ?{
                        name;
                        resumable;
                        type_;
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

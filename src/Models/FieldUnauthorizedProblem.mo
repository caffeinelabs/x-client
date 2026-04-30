/// A problem that indicates that you are not allowed to see a particular field on a Tweet, User, etc.

import { type DisallowedResourceProblemAllOfResourceType; JSON = DisallowedResourceProblemAllOfResourceType } "./DisallowedResourceProblemAllOfResourceType";

import { type DisallowedResourceProblemAllOfSection; JSON = DisallowedResourceProblemAllOfSection } "./DisallowedResourceProblemAllOfSection";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// FieldUnauthorizedProblem.mo

module {
    /// The required-fields slice of FieldUnauthorizedProblem — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        title : Text;
        type_ : Text;
        field : Text;
        resource_type : DisallowedResourceProblemAllOfResourceType;
        section : DisallowedResourceProblemAllOfSection;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express FieldUnauthorizedProblem as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        detail : ?Text;
        status : ?Int;
    };

    public type FieldUnauthorizedProblem = Required and Optional;

    public module JSON {
        // `init` constructs a FieldUnauthorizedProblem from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { FieldUnauthorizedProblem.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : FieldUnauthorizedProblem {
            let ?res = from_candid(to_candid(required)) : ?FieldUnauthorizedProblem else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : FieldUnauthorizedProblem) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.detail) {
                case (?v__) List.add(buf, ("detail", #Text(v__)));
                case null ();
            };
            switch (value.status) {
                case (?v__) List.add(buf, ("status", #Int(v__)));
                case null ();
            };
            List.add(buf, ("title", #Text(value.title)));
            List.add(buf, ("type", #Text(value.type_)));
            List.add(buf, ("field", #Text(value.field)));
            List.add(buf, ("resource_type", DisallowedResourceProblemAllOfResourceType.toCandidValue(value.resource_type)));
            List.add(buf, ("section", DisallowedResourceProblemAllOfSection.toCandidValue(value.section)));
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?FieldUnauthorizedProblem =
            switch (candid) {
                case (#Record(fields)) {
                    let detail : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "detail")) {
                        case (?detail_field) ((switch (detail_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let status : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "status")) {
                        case (?status_field) ((switch (status_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let ?title_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "title") else return null;
                    let ?title = ((switch (title_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?type__field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "type") else return null;
                    let ?type_ = ((switch (type__field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?field_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "field") else return null;
                    let ?field = ((switch (field_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let ?resource_type_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "resource_type") else return null;
                    let ?resource_type = (DisallowedResourceProblemAllOfResourceType.fromCandidValue(resource_type_field.1)) else return null;
                    let ?section_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "section") else return null;
                    let ?section = (DisallowedResourceProblemAllOfSection.fromCandidValue(section_field.1)) else return null;
                    ?{
                        detail;
                        status;
                        title;
                        type_;
                        field;
                        resource_type;
                        section;
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

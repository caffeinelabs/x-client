/// A problem that indicates something is wrong with the connection.

import { type ConnectionExceptionProblemAllOfConnectionIssue; JSON = ConnectionExceptionProblemAllOfConnectionIssue } "./ConnectionExceptionProblemAllOfConnectionIssue";

import { type Problem; JSON = Problem } "./Problem";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ConnectionExceptionProblem.mo

module {
    /// The required-fields slice of ConnectionExceptionProblem — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        title : Text;
        type_ : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ConnectionExceptionProblem as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        detail : ?Text;
        status : ?Int;
        connection_issue : ?ConnectionExceptionProblemAllOfConnectionIssue;
    };

    public type ConnectionExceptionProblem = Required and Optional;

    public module JSON {
        // `init` constructs a ConnectionExceptionProblem from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ConnectionExceptionProblem.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ConnectionExceptionProblem {
            let ?res = from_candid(to_candid(required)) : ?ConnectionExceptionProblem else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ConnectionExceptionProblem) : Candid.Candid {
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
            switch (value.connection_issue) {
                case (?v__) List.add(buf, ("connection_issue", ConnectionExceptionProblemAllOfConnectionIssue.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ConnectionExceptionProblem =
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
                    let connection_issue : ?ConnectionExceptionProblemAllOfConnectionIssue = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "connection_issue")) {
                        case (?connection_issue_field) (ConnectionExceptionProblemAllOfConnectionIssue.fromCandidValue(connection_issue_field.1));
                        case null null;
                    };
                    ?{
                        detail;
                        status;
                        title;
                        type_;
                        connection_issue;
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


import { type AudiencePolicyCreatorSubscriptionsInner; JSON = AudiencePolicyCreatorSubscriptionsInner } "./AudiencePolicyCreatorSubscriptionsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// AudiencePolicy.mo

module {
    /// The required-fields slice of AudiencePolicy — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express AudiencePolicy as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        creator_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
        x_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
    };

    public type AudiencePolicy = Required and Optional;

    public module JSON {
        // `init` constructs a AudiencePolicy from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { AudiencePolicy.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : AudiencePolicy {
            let ?res = from_candid(to_candid(required)) : ?AudiencePolicy else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : AudiencePolicy) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.creator_subscriptions) {
                case (?v__) List.add(buf, ("creator_subscriptions", #Array(Array.map<AudiencePolicyCreatorSubscriptionsInner, Candid.Candid>(v__, AudiencePolicyCreatorSubscriptionsInner.toCandidValue))));
                case null ();
            };
            switch (value.x_subscriptions) {
                case (?v__) List.add(buf, ("x_subscriptions", #Array(Array.map<AudiencePolicyCreatorSubscriptionsInner, Candid.Candid>(v__, AudiencePolicyCreatorSubscriptionsInner.toCandidValue))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?AudiencePolicy =
            switch (candid) {
                case (#Record(fields)) {
                    let creator_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "creator_subscriptions")) {
                        case (?creator_subscriptions_field) ((switch (creator_subscriptions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<AudiencePolicyCreatorSubscriptionsInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = AudiencePolicyCreatorSubscriptionsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let x_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "x_subscriptions")) {
                        case (?x_subscriptions_field) ((switch (x_subscriptions_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<AudiencePolicyCreatorSubscriptionsInner>();
                            for (c__ in xs__.values()) {
                                let ?e__ = AudiencePolicyCreatorSubscriptionsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, e__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        creator_subscriptions;
                        x_subscriptions;
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

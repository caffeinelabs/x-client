
import { type AudiencePolicyCreatorSubscriptionsInner; JSON = AudiencePolicyCreatorSubscriptionsInner } "./AudiencePolicyCreatorSubscriptionsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// AudiencePolicy.mo

module {
    public type AudiencePolicy = {
        creator_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
        x_subscriptions : ?[AudiencePolicyCreatorSubscriptionsInner];
    };

    public module JSON {
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
};

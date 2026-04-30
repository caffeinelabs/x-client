/// Tweet compliance data.

import { type TweetComplianceSchema; JSON = TweetComplianceSchema } "./TweetComplianceSchema";

import { type TweetDeleteComplianceSchema; JSON = TweetDeleteComplianceSchema } "./TweetDeleteComplianceSchema";

import { type TweetDropComplianceSchema; JSON = TweetDropComplianceSchema } "./TweetDropComplianceSchema";

import { type TweetEditComplianceObjectSchema; JSON = TweetEditComplianceObjectSchema } "./TweetEditComplianceObjectSchema";

import { type TweetEditComplianceSchema; JSON = TweetEditComplianceSchema } "./TweetEditComplianceSchema";

import { type TweetTakedownComplianceSchema; JSON = TweetTakedownComplianceSchema } "./TweetTakedownComplianceSchema";

import { type TweetUndropComplianceSchema; JSON = TweetUndropComplianceSchema } "./TweetUndropComplianceSchema";

import { type TweetWithheldComplianceSchema; JSON = TweetWithheldComplianceSchema } "./TweetWithheldComplianceSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// TweetComplianceData.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.

module {
    public type TweetComplianceData = {
        #TweetDeleteComplianceSchema : TweetDeleteComplianceSchema;
        #TweetWithheldComplianceSchema : TweetWithheldComplianceSchema;
        #TweetDropComplianceSchema : TweetDropComplianceSchema;
        #TweetUndropComplianceSchema : TweetUndropComplianceSchema;
        #TweetEditComplianceSchema : TweetEditComplianceSchema;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetComplianceData) : Text =
            switch (value) {
                case (#TweetDeleteComplianceSchema(v)) Runtime.unreachable();
                case (#TweetWithheldComplianceSchema(v)) Runtime.unreachable();
                case (#TweetDropComplianceSchema(v)) Runtime.unreachable();
                case (#TweetUndropComplianceSchema(v)) Runtime.unreachable();
                case (#TweetEditComplianceSchema(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : TweetComplianceData) : Candid.Candid =
            switch (value) {
                case (#TweetDeleteComplianceSchema(v)) #Variant(("TweetDeleteComplianceSchema", TweetDeleteComplianceSchema.toCandidValue(v)));
                case (#TweetWithheldComplianceSchema(v)) #Variant(("TweetWithheldComplianceSchema", TweetWithheldComplianceSchema.toCandidValue(v)));
                case (#TweetDropComplianceSchema(v)) #Variant(("TweetDropComplianceSchema", TweetDropComplianceSchema.toCandidValue(v)));
                case (#TweetUndropComplianceSchema(v)) #Variant(("TweetUndropComplianceSchema", TweetUndropComplianceSchema.toCandidValue(v)));
                case (#TweetEditComplianceSchema(v)) #Variant(("TweetEditComplianceSchema", TweetEditComplianceSchema.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetComplianceData =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("TweetDeleteComplianceSchema") {
                            let ?inner = TweetDeleteComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetDeleteComplianceSchema(inner)
                        };
                        case ("TweetWithheldComplianceSchema") {
                            let ?inner = TweetWithheldComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetWithheldComplianceSchema(inner)
                        };
                        case ("TweetDropComplianceSchema") {
                            let ?inner = TweetDropComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetDropComplianceSchema(inner)
                        };
                        case ("TweetUndropComplianceSchema") {
                            let ?inner = TweetUndropComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetUndropComplianceSchema(inner)
                        };
                        case ("TweetEditComplianceSchema") {
                            let ?inner = TweetEditComplianceSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetEditComplianceSchema(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};

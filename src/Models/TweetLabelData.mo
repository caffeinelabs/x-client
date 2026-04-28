/// Tweet label data.

import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";

import { type TweetNoticeSchema; JSON = TweetNoticeSchema } "./TweetNoticeSchema";

import { type TweetUnviewable; JSON = TweetUnviewable } "./TweetUnviewable";

import { type TweetUnviewableSchema; JSON = TweetUnviewableSchema } "./TweetUnviewableSchema";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// TweetLabelData.mo
// Generic oneOf (no discriminator, no flatten) — wire form is `{"#tag": ...}`.
import Runtime "mo:core/Runtime";

module {
    public type TweetLabelData = {
        #TweetNoticeSchema : TweetNoticeSchema;
        #TweetUnviewableSchema : TweetUnviewableSchema;
    };

    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetLabelData) : Text =
            switch (value) {
                case (#TweetNoticeSchema(v)) Runtime.unreachable();
                case (#TweetUnviewableSchema(v)) Runtime.unreachable();
            };

        public func toCandidValue(value : TweetLabelData) : Candid.Candid =
            switch (value) {
                case (#TweetNoticeSchema(v)) #Variant(("TweetNoticeSchema", TweetNoticeSchema.toCandidValue(v)));
                case (#TweetUnviewableSchema(v)) #Variant(("TweetUnviewableSchema", TweetUnviewableSchema.toCandidValue(v)));
            };

        public func fromCandidValue(candid : Candid.Candid) : ?TweetLabelData =
            switch (candid) {
                case (#Variant(tagAndVal)) {
                    switch (tagAndVal.0) {
                        case ("TweetNoticeSchema") {
                            let ?inner = TweetNoticeSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetNoticeSchema(inner)
                        };
                        case ("TweetUnviewableSchema") {
                            let ?inner = TweetUnviewableSchema.fromCandidValue(tagAndVal.1) else return null;
                            ?#TweetUnviewableSchema(inner)
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};

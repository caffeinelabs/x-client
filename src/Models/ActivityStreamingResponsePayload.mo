
import { type FollowActivityResponsePayload; JSON = FollowActivityResponsePayload } "./FollowActivityResponsePayload";

import { type NewsActivityResponsePayload; JSON = NewsActivityResponsePayload } "./NewsActivityResponsePayload";

import { type ProfileUpdateActivityResponsePayload; JSON = ProfileUpdateActivityResponsePayload } "./ProfileUpdateActivityResponsePayload";

import { type User; JSON = User } "./User";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ActivityStreamingResponsePayload.mo
// Discriminator-oneOf — wire is a flat object whose `_../event_type`
// field selects the schema. Branches' `toCandidValue` already include that field, so dispatch
// is just a forward call (no re-wrapping).

module {
    public type ActivityStreamingResponsePayload = {
        #profile_update_verified_badge : ProfileUpdateActivityResponsePayload;
        #news_new : NewsActivityResponsePayload;
        #follow_unfollow : FollowActivityResponsePayload;
    };

    public module JSON {
        public func toCandidValue(value : ActivityStreamingResponsePayload) : Candid.Candid =
            switch (value) {
                case (#profile_update_verified_badge(v)) ProfileUpdateActivityResponsePayload.toCandidValue(v);
                case (#news_new(v)) NewsActivityResponsePayload.toCandidValue(v);
                case (#follow_unfollow(v)) FollowActivityResponsePayload.toCandidValue(v);
            };

        public func toText(value : ActivityStreamingResponsePayload) : Text =
            switch (value) {
                case (#profile_update_verified_badge(_)) "profile.update.verified_badge";
                case (#news_new(_)) "news.new";
                case (#follow_unfollow(_)) "follow.unfollow";
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ActivityStreamingResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let ?discPair = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "_../event_type") else return null;
                    switch (discPair.1) {
                        case (#Text(disc)) {
                            switch (disc) {
                                case ("profile.update.verified_badge") {
                                    let ?inner = ProfileUpdateActivityResponsePayload.fromCandidValue(candid) else return null;
                                    ?#profile_update_verified_badge(inner);
                                };
                                case ("news.new") {
                                    let ?inner = NewsActivityResponsePayload.fromCandidValue(candid) else return null;
                                    ?#news_new(inner);
                                };
                                case ("follow.unfollow") {
                                    let ?inner = FollowActivityResponsePayload.fromCandidValue(candid) else return null;
                                    ?#follow_unfollow(inner);
                                };
                                case _ null;
                            };
                        };
                        case _ null;
                    };
                };
                case _ null;
            };
    };
};

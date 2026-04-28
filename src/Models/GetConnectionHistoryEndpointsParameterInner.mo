import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetConnectionHistoryEndpointsParameterInner.mo
/// Enum values: #filtered_stream, #sample_stream, #sample10_stream, #firehose_stream, #tweets_compliance_stream, #users_compliance_stream, #tweet_label_stream, #firehose_stream_lang_en, #firehose_stream_lang_ja, #firehose_stream_lang_ko, #firehose_stream_lang_pt, #likes_firehose_stream, #likes_sample10_stream, #likes_compliance_stream

module {
    public type GetConnectionHistoryEndpointsParameterInner = {
        #filtered_stream;
        #sample_stream;
        #sample10_stream;
        #firehose_stream;
        #tweets_compliance_stream;
        #users_compliance_stream;
        #tweet_label_stream;
        #firehose_stream_lang_en;
        #firehose_stream_lang_ja;
        #firehose_stream_lang_ko;
        #firehose_stream_lang_pt;
        #likes_firehose_stream;
        #likes_sample10_stream;
        #likes_compliance_stream;
    };

    public module JSON {
        public func toCandidValue(value : GetConnectionHistoryEndpointsParameterInner) : Candid.Candid =
            switch (value) {
                case (#filtered_stream) #Text("filtered_stream");
                case (#sample_stream) #Text("sample_stream");
                case (#sample10_stream) #Text("sample10_stream");
                case (#firehose_stream) #Text("firehose_stream");
                case (#tweets_compliance_stream) #Text("tweets_compliance_stream");
                case (#users_compliance_stream) #Text("users_compliance_stream");
                case (#tweet_label_stream) #Text("tweet_label_stream");
                case (#firehose_stream_lang_en) #Text("firehose_stream_lang_en");
                case (#firehose_stream_lang_ja) #Text("firehose_stream_lang_ja");
                case (#firehose_stream_lang_ko) #Text("firehose_stream_lang_ko");
                case (#firehose_stream_lang_pt) #Text("firehose_stream_lang_pt");
                case (#likes_firehose_stream) #Text("likes_firehose_stream");
                case (#likes_sample10_stream) #Text("likes_sample10_stream");
                case (#likes_compliance_stream) #Text("likes_compliance_stream");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetConnectionHistoryEndpointsParameterInner =
            switch (candid) {
                case (#Text("filtered_stream")) ?#filtered_stream;
                case (#Text("sample_stream")) ?#sample_stream;
                case (#Text("sample10_stream")) ?#sample10_stream;
                case (#Text("firehose_stream")) ?#firehose_stream;
                case (#Text("tweets_compliance_stream")) ?#tweets_compliance_stream;
                case (#Text("users_compliance_stream")) ?#users_compliance_stream;
                case (#Text("tweet_label_stream")) ?#tweet_label_stream;
                case (#Text("firehose_stream_lang_en")) ?#firehose_stream_lang_en;
                case (#Text("firehose_stream_lang_ja")) ?#firehose_stream_lang_ja;
                case (#Text("firehose_stream_lang_ko")) ?#firehose_stream_lang_ko;
                case (#Text("firehose_stream_lang_pt")) ?#firehose_stream_lang_pt;
                case (#Text("likes_firehose_stream")) ?#likes_firehose_stream;
                case (#Text("likes_sample10_stream")) ?#likes_sample10_stream;
                case (#Text("likes_compliance_stream")) ?#likes_compliance_stream;
                case _ null;
            };

        public func toText(value : GetConnectionHistoryEndpointsParameterInner) : Text =
            switch (value) {
                case (#filtered_stream) "filtered_stream";
                case (#sample_stream) "sample_stream";
                case (#sample10_stream) "sample10_stream";
                case (#firehose_stream) "firehose_stream";
                case (#tweets_compliance_stream) "tweets_compliance_stream";
                case (#users_compliance_stream) "users_compliance_stream";
                case (#tweet_label_stream) "tweet_label_stream";
                case (#firehose_stream_lang_en) "firehose_stream_lang_en";
                case (#firehose_stream_lang_ja) "firehose_stream_lang_ja";
                case (#firehose_stream_lang_ko) "firehose_stream_lang_ko";
                case (#firehose_stream_lang_pt) "firehose_stream_lang_pt";
                case (#likes_firehose_stream) "likes_firehose_stream";
                case (#likes_sample10_stream) "likes_sample10_stream";
                case (#likes_compliance_stream) "likes_compliance_stream";
            };
    };
};

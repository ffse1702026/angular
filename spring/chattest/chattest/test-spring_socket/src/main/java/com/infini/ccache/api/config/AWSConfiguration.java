package com.infini.ccache.api.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

// TODO: Auto-generated Javadoc
/**
 * The Class AWSConfiguration.
 */
@Configuration
public class AWSConfiguration {

	/** The access key. */
	@Value("${cloud.aws.credentials.accessKey}")
    private String accessKey;

	/** The secret key. */
	@Value("${cloud.aws.credentials.secretKey}")
    private String secretKey;

	/** The region. */
	@Value("${cloud.aws.region}")
    private String region;

    /**
     * Basic AWS credentials.
     *
     * @return the basic AWS credentials
     */
    @Bean
    public BasicAWSCredentials basicAWSCredentials() {
        return new BasicAWSCredentials(accessKey, secretKey);
    }

    /**
     * Amazon S 3 client.
     *
     * @param awsCredentials the aws credentials
     * @return the amazon S 3
     */
    @Bean
    public AmazonS3 amazonS3Client(AWSCredentials awsCredentials) {
    	AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
                .withRegion(region)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
        return s3Client;
    }
}

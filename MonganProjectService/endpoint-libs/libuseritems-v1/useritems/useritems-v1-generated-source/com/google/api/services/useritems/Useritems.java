/*
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */
/*
 * This file was generated.
 *  with google-apis-code-generator 1.2.0 (build: 2013-03-04 17:44:07 UTC)
 *  on 2013-03-17 at 01:12:45 UTC 
 */

package com.google.api.services.useritems;

import com.google.api.client.googleapis.GoogleUtils;
import com.google.api.client.googleapis.services.AbstractGoogleClientRequest;
import com.google.api.client.googleapis.services.GoogleClientRequestInitializer;
import com.google.api.client.googleapis.services.json.AbstractGoogleJsonClient;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonObjectParser;
import com.google.api.client.json.JsonString;
import com.google.common.base.Preconditions;

/**
 * Service definition for Useritems (v1).
 *
 * <p>
 * This is an API
 * </p>
 *
 * <p>
 * For more information about this service, see the
 * <a href="" target="_blank">API Documentation</a>
 * </p>
 *
 * <p>
 * This service uses {@link UseritemsRequestInitializer} to initialize global parameters via its
 * {@link Builder}.
 * </p>
 *
 * <p>
 * Upgrade warning: this class now extends {@link AbstractGoogleJsonClient}, whereas in prior
 * version 1.8 it extended {@link com.google.api.client.googleapis.services.GoogleClient}.
 * </p>
 *
 * @since 1.3
 * @author Google, Inc.
 */
@SuppressWarnings("javadoc")
public class Useritems extends AbstractGoogleJsonClient {

  // Note: Leave this static initializer at the top of the file.
  static {
    Preconditions.checkState(GoogleUtils.VERSION.equals("1.13.2-beta"),
        "You are currently running with version %s of google-api-client. " +
        "You need version 1.13.2-beta of google-api-client to run version " +
        "1.13.2-beta of the  library.", GoogleUtils.VERSION);
  }

  /**
   * The default encoded root URL of the service. This is determined when the library is generated
   * and normally should not be changed.
   *
   * @since 1.7
   */
  public static final String DEFAULT_ROOT_URL = "https://monganproject.appspot.com/_ah/api/";

  /**
   * The default encoded service path of the service. This is determined when the library is
   * generated and normally should not be changed.
   *
   * @since 1.7
   */
  public static final String DEFAULT_SERVICE_PATH = "useritems/v1/";

  /**
   * The default encoded base URL of the service. This is determined when the library is generated
   * and normally should not be changed.
   * @deprecated (scheduled to be removed in 1.13)
   */
  @Deprecated
  public static final String DEFAULT_BASE_URL = DEFAULT_ROOT_URL + DEFAULT_SERVICE_PATH;

  /**
   * Constructor.
   *
   * <p>
   * Use {@link Builder} if you need to specify any of the optional parameters.
   * </p>
   *
   * @param transport HTTP transport
   * @param jsonFactory JSON factory
   * @param httpRequestInitializer HTTP request initializer or {@code null} for none
   * @since 1.7
   */
  public Useritems(HttpTransport transport, JsonFactory jsonFactory,
      HttpRequestInitializer httpRequestInitializer) {
    super(transport,
        jsonFactory,
        DEFAULT_ROOT_URL,
        DEFAULT_SERVICE_PATH,
        httpRequestInitializer,
        false);
  }

  /**
   * @param transport HTTP transport
   * @param httpRequestInitializer HTTP request initializer or {@code null} for none
   * @param rootUrl root URL of the service
   * @param servicePath service path
   * @param jsonObjectParser JSON object parser
   * @param googleClientRequestInitializer Google request initializer or {@code null} for none
   * @param applicationName application name to be sent in the User-Agent header of requests or
   *        {@code null} for none
   * @param suppressPatternChecks whether discovery pattern checks should be suppressed on required
   *        parameters
   */
  Useritems(HttpTransport transport,
      HttpRequestInitializer httpRequestInitializer,
      String rootUrl,
      String servicePath,
      JsonObjectParser jsonObjectParser,
      GoogleClientRequestInitializer googleClientRequestInitializer,
      String applicationName,
      boolean suppressPatternChecks) {
    super(transport,
        httpRequestInitializer,
        rootUrl,
        servicePath,
        jsonObjectParser,
        googleClientRequestInitializer,
        applicationName,
        suppressPatternChecks);
  }

  @Override
  protected void initialize(AbstractGoogleClientRequest<?> httpClientRequest) throws java.io.IOException {
    super.initialize(httpClientRequest);
  }

  /**
   * Create a request for the method "delete".
   *
   * This request holds the parameters needed by the the useritems server.  After setting any optional
   * parameters, call the {@link Delete#execute()} method to invoke the remote operation.
   *
   * @param productKey
   * @return the request
   */
  public Delete delete(String productKey) throws java.io.IOException {
    Delete result = new Delete(productKey);
    initialize(result);
    return result;
  }

  public class Delete extends UseritemsRequest<Void> {

    private static final String REST_PATH = "delete/{productKey}";

    /**
     * Create a request for the method "delete".
     *
     * This request holds the parameters needed by the the useritems server.  After setting any
     * optional parameters, call the {@link Delete#execute()} method to invoke the remote operation.
     * <p> {@link Delete#initialize(AbstractGoogleClientRequest)} must be called to initialize this
     * instance immediately after invoking the constructor. </p>
     *
     * @param productKey
     * @since 1.13
     */
    protected Delete(String productKey) {
      super(Useritems.this, "DELETE", REST_PATH, null, Void.class);
      this.productKey = Preconditions.checkNotNull(productKey, "Required parameter productKey must be specified.");
    }

    @Override
    public Delete setAlt(String alt) {
      return (Delete) super.setAlt(alt);
    }

    @Override
    public Delete setFields(String fields) {
      return (Delete) super.setFields(fields);
    }

    @Override
    public Delete setKey(String key) {
      return (Delete) super.setKey(key);
    }

    @Override
    public Delete setOauthToken(String oauthToken) {
      return (Delete) super.setOauthToken(oauthToken);
    }

    @Override
    public Delete setPrettyPrint(Boolean prettyPrint) {
      return (Delete) super.setPrettyPrint(prettyPrint);
    }

    @Override
    public Delete setQuotaUser(String quotaUser) {
      return (Delete) super.setQuotaUser(quotaUser);
    }

    @Override
    public Delete setUserIp(String userIp) {
      return (Delete) super.setUserIp(userIp);
    }

    @com.google.api.client.util.Key
    private String productKey;

    /**

     */
    public String getProductKey() {
      return productKey;
    }

    public Delete setProductKey(String productKey) {
      this.productKey = productKey;
      return this;
    }

  }

  /**
   * Create a request for the method "list".
   *
   * This request holds the parameters needed by the the useritems server.  After setting any optional
   * parameters, call the {@link List#execute()} method to invoke the remote operation.
   *
   * @return the request
   */
  public List list() throws java.io.IOException {
    List result = new List();
    initialize(result);
    return result;
  }

  public class List extends UseritemsRequest<com.google.api.services.useritems.model.DesiredItemCollection> {

    private static final String REST_PATH = "desireditem";

    /**
     * Create a request for the method "list".
     *
     * This request holds the parameters needed by the the useritems server.  After setting any
     * optional parameters, call the {@link List#execute()} method to invoke the remote operation. <p>
     * {@link List#initialize(AbstractGoogleClientRequest)} must be called to initialize this instance
     * immediately after invoking the constructor. </p>
     *
     * @since 1.13
     */
    protected List() {
      super(Useritems.this, "GET", REST_PATH, null, com.google.api.services.useritems.model.DesiredItemCollection.class);
    }

    @Override
    public com.google.api.client.http.HttpResponse executeUsingHead() throws java.io.IOException {
      return super.executeUsingHead();
    }

    @Override
    public com.google.api.client.http.HttpRequest buildHttpRequestUsingHead() throws java.io.IOException {
      return super.buildHttpRequestUsingHead();
    }

    @Override
    public List setAlt(String alt) {
      return (List) super.setAlt(alt);
    }

    @Override
    public List setFields(String fields) {
      return (List) super.setFields(fields);
    }

    @Override
    public List setKey(String key) {
      return (List) super.setKey(key);
    }

    @Override
    public List setOauthToken(String oauthToken) {
      return (List) super.setOauthToken(oauthToken);
    }

    @Override
    public List setPrettyPrint(Boolean prettyPrint) {
      return (List) super.setPrettyPrint(prettyPrint);
    }

    @Override
    public List setQuotaUser(String quotaUser) {
      return (List) super.setQuotaUser(quotaUser);
    }

    @Override
    public List setUserIp(String userIp) {
      return (List) super.setUserIp(userIp);
    }

  }

  /**
   * Create a request for the method "upsert".
   *
   * This request holds the parameters needed by the the useritems server.  After setting any optional
   * parameters, call the {@link Upsert#execute()} method to invoke the remote operation.
   *
   * @param productKey
   * @param desired
   * @param have
   * @return the request
   */
  public Upsert upsert(String productKey, Long desired, Long have) throws java.io.IOException {
    Upsert result = new Upsert(productKey, desired, have);
    initialize(result);
    return result;
  }

  public class Upsert extends UseritemsRequest<com.google.api.services.useritems.model.DesiredItem> {

    private static final String REST_PATH = "upsert/{productKey}/{desired}/{have}";

    /**
     * Create a request for the method "upsert".
     *
     * This request holds the parameters needed by the the useritems server.  After setting any
     * optional parameters, call the {@link Upsert#execute()} method to invoke the remote operation.
     * <p> {@link Upsert#initialize(AbstractGoogleClientRequest)} must be called to initialize this
     * instance immediately after invoking the constructor. </p>
     *
     * @param productKey
     * @param desired
     * @param have
     * @since 1.13
     */
    protected Upsert(String productKey, Long desired, Long have) {
      super(Useritems.this, "POST", REST_PATH, null, com.google.api.services.useritems.model.DesiredItem.class);
      this.productKey = Preconditions.checkNotNull(productKey, "Required parameter productKey must be specified.");
      this.desired = Preconditions.checkNotNull(desired, "Required parameter desired must be specified.");
      this.have = Preconditions.checkNotNull(have, "Required parameter have must be specified.");
    }

    @Override
    public Upsert setAlt(String alt) {
      return (Upsert) super.setAlt(alt);
    }

    @Override
    public Upsert setFields(String fields) {
      return (Upsert) super.setFields(fields);
    }

    @Override
    public Upsert setKey(String key) {
      return (Upsert) super.setKey(key);
    }

    @Override
    public Upsert setOauthToken(String oauthToken) {
      return (Upsert) super.setOauthToken(oauthToken);
    }

    @Override
    public Upsert setPrettyPrint(Boolean prettyPrint) {
      return (Upsert) super.setPrettyPrint(prettyPrint);
    }

    @Override
    public Upsert setQuotaUser(String quotaUser) {
      return (Upsert) super.setQuotaUser(quotaUser);
    }

    @Override
    public Upsert setUserIp(String userIp) {
      return (Upsert) super.setUserIp(userIp);
    }

    @com.google.api.client.util.Key
    private String productKey;

    /**

     */
    public String getProductKey() {
      return productKey;
    }

    public Upsert setProductKey(String productKey) {
      this.productKey = productKey;
      return this;
    }

    @com.google.api.client.util.Key
    private Long desired;

    /**

     */
    public Long getDesired() {
      return desired;
    }

    public Upsert setDesired(Long desired) {
      this.desired = desired;
      return this;
    }

    @com.google.api.client.util.Key
    private Long have;

    /**

     */
    public Long getHave() {
      return have;
    }

    public Upsert setHave(Long have) {
      this.have = have;
      return this;
    }

  }

  /**
   * Builder for {@link Useritems}.
   *
   * <p>
   * Implementation is not thread-safe.
   * </p>
   *
   * @since 1.3.0
   */
  public static final class Builder extends AbstractGoogleJsonClient.Builder {

    /**
     * Returns an instance of a new builder.
     *
     * @param transport HTTP transport
     * @param jsonFactory JSON factory
     * @param httpRequestInitializer HTTP request initializer or {@code null} for none
     * @since 1.7
     */
    public Builder(HttpTransport transport, JsonFactory jsonFactory,
        HttpRequestInitializer httpRequestInitializer) {
      super(
          transport,
          jsonFactory,
          DEFAULT_ROOT_URL,
          DEFAULT_SERVICE_PATH,
          httpRequestInitializer,
          false);
    }

    /** Builds a new instance of {@link Useritems}. */
    @Override
    public Useritems build() {
      return new Useritems(getTransport(),
          getHttpRequestInitializer(),
          getRootUrl(),
          getServicePath(),
          getObjectParser(),
          getGoogleClientRequestInitializer(),
          getApplicationName(),
          getSuppressPatternChecks());
    }

    @Override
    public Builder setRootUrl(String rootUrl) {
      return (Builder) super.setRootUrl(rootUrl);
    }

    @Override
    public Builder setServicePath(String servicePath) {
      return (Builder) super.setServicePath(servicePath);
    }

    @Override
    public Builder setHttpRequestInitializer(HttpRequestInitializer httpRequestInitializer) {
      return (Builder) super.setHttpRequestInitializer(httpRequestInitializer);
    }

    @Override
    public Builder setApplicationName(String applicationName) {
      return (Builder) super.setApplicationName(applicationName);
    }

    @Override
    public Builder setSuppressPatternChecks(boolean suppressPatternChecks) {
      return (Builder) super.setSuppressPatternChecks(suppressPatternChecks);
    }

    /**
     * Set the {@link UseritemsRequestInitializer}.
     *
     * @since 1.12
     */
    public Builder setUseritemsRequestInitializer(
        UseritemsRequestInitializer useritemsRequestInitializer) {
      return (Builder) super.setGoogleClientRequestInitializer(useritemsRequestInitializer);
    }

    @Override
    public Builder setGoogleClientRequestInitializer(
        GoogleClientRequestInitializer googleClientRequestInitializer) {
      return (Builder) super.setGoogleClientRequestInitializer(googleClientRequestInitializer);
    }
  }
}

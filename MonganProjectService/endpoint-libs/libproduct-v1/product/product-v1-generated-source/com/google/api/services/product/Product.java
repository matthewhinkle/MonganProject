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
 *  on 2013-03-17 at 01:12:47 UTC 
 */

package com.google.api.services.product;

import com.google.api.client.googleapis.GoogleUtils;
import com.google.api.client.googleapis.services.AbstractGoogleClientRequest;
import com.google.api.client.googleapis.services.GoogleClientRequestInitializer;
import com.google.api.client.googleapis.services.json.AbstractGoogleJsonClient;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonObjectParser;
import com.google.common.base.Preconditions;

/**
 * Service definition for Product (v1).
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
 * This service uses {@link ProductRequestInitializer} to initialize global parameters via its
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
public class Product extends AbstractGoogleJsonClient {

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
  public static final String DEFAULT_SERVICE_PATH = "product/v1/";

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
  public Product(HttpTransport transport, JsonFactory jsonFactory,
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
  Product(HttpTransport transport,
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
   * An accessor for creating requests from the Search collection.
   *
   * <p>The typical use is:</p>
   * <pre>
   *   {@code Product product = new Product(...);}
   *   {@code Product.Search.List request = product.search().list(parameters ...)}
   * </pre>
   *
   * @return the resource collection
   */
  public Search search() {
    return new Search();
  }

  /**
   * The "search" collection of methods.
   */
  public class Search {

    /**
     * Create a request for the method "search.name".
     *
     * This request holds the parameters needed by the the product server.  After setting any optional
     * parameters, call the {@link Name#execute()} method to invoke the remote operation.
     *
     * @param name
     * @return the request
     */
    public Name name(String name) throws java.io.IOException {
      Name result = new Name(name);
      initialize(result);
      return result;
    }

    public class Name extends ProductRequest<com.google.api.services.product.model.ProductCollection> {

      private static final String REST_PATH = "requestByName/{name}";

      /**
       * Create a request for the method "search.name".
       *
       * This request holds the parameters needed by the the product server.  After setting any optional
       * parameters, call the {@link Name#execute()} method to invoke the remote operation. <p> {@link
       * Name#initialize(AbstractGoogleClientRequest)} must be called to initialize this instance
       * immediately after invoking the constructor. </p>
       *
       * @param name
       * @since 1.13
       */
      protected Name(String name) {
        super(Product.this, "POST", REST_PATH, null, com.google.api.services.product.model.ProductCollection.class);
        this.name = Preconditions.checkNotNull(name, "Required parameter name must be specified.");
      }

      @Override
      public Name setAlt(String alt) {
        return (Name) super.setAlt(alt);
      }

      @Override
      public Name setFields(String fields) {
        return (Name) super.setFields(fields);
      }

      @Override
      public Name setKey(String key) {
        return (Name) super.setKey(key);
      }

      @Override
      public Name setOauthToken(String oauthToken) {
        return (Name) super.setOauthToken(oauthToken);
      }

      @Override
      public Name setPrettyPrint(Boolean prettyPrint) {
        return (Name) super.setPrettyPrint(prettyPrint);
      }

      @Override
      public Name setQuotaUser(String quotaUser) {
        return (Name) super.setQuotaUser(quotaUser);
      }

      @Override
      public Name setUserIp(String userIp) {
        return (Name) super.setUserIp(userIp);
      }

      @com.google.api.client.util.Key
      private String name;

      /**

       */
      public String getName() {
        return name;
      }

      public Name setName(String name) {
        this.name = name;
        return this;
      }

    }
    /**
     * Create a request for the method "search.upc".
     *
     * This request holds the parameters needed by the the product server.  After setting any optional
     * parameters, call the {@link Upc#execute()} method to invoke the remote operation.
     *
     * @param upc
     * @return the request
     */
    public Upc upc(String upc) throws java.io.IOException {
      Upc result = new Upc(upc);
      initialize(result);
      return result;
    }

    public class Upc extends ProductRequest<com.google.api.services.product.model.ProductCollection> {

      private static final String REST_PATH = "requestByUpc/{upc}";

      /**
       * Create a request for the method "search.upc".
       *
       * This request holds the parameters needed by the the product server.  After setting any optional
       * parameters, call the {@link Upc#execute()} method to invoke the remote operation. <p> {@link
       * Upc#initialize(AbstractGoogleClientRequest)} must be called to initialize this instance
       * immediately after invoking the constructor. </p>
       *
       * @param upc
       * @since 1.13
       */
      protected Upc(String upc) {
        super(Product.this, "POST", REST_PATH, null, com.google.api.services.product.model.ProductCollection.class);
        this.upc = Preconditions.checkNotNull(upc, "Required parameter upc must be specified.");
      }

      @Override
      public Upc setAlt(String alt) {
        return (Upc) super.setAlt(alt);
      }

      @Override
      public Upc setFields(String fields) {
        return (Upc) super.setFields(fields);
      }

      @Override
      public Upc setKey(String key) {
        return (Upc) super.setKey(key);
      }

      @Override
      public Upc setOauthToken(String oauthToken) {
        return (Upc) super.setOauthToken(oauthToken);
      }

      @Override
      public Upc setPrettyPrint(Boolean prettyPrint) {
        return (Upc) super.setPrettyPrint(prettyPrint);
      }

      @Override
      public Upc setQuotaUser(String quotaUser) {
        return (Upc) super.setQuotaUser(quotaUser);
      }

      @Override
      public Upc setUserIp(String userIp) {
        return (Upc) super.setUserIp(userIp);
      }

      @com.google.api.client.util.Key
      private String upc;

      /**

       */
      public String getUpc() {
        return upc;
      }

      public Upc setUpc(String upc) {
        this.upc = upc;
        return this;
      }

    }

  }

  /**
   * Create a request for the method "insert".
   *
   * This request holds the parameters needed by the the product server.  After setting any optional
   * parameters, call the {@link Insert#execute()} method to invoke the remote operation.
   *
   * @param content the {@link com.google.api.services.product.model.Product}
   * @return the request
   */
  public Insert insert(com.google.api.services.product.model.Product content) throws java.io.IOException {
    Insert result = new Insert(content);
    initialize(result);
    return result;
  }

  public class Insert extends ProductRequest<com.google.api.services.product.model.Product> {

    private static final String REST_PATH = "product";

    /**
     * Create a request for the method "insert".
     *
     * This request holds the parameters needed by the the product server.  After setting any optional
     * parameters, call the {@link Insert#execute()} method to invoke the remote operation. <p> {@link
     * Insert#initialize(AbstractGoogleClientRequest)} must be called to initialize this instance
     * immediately after invoking the constructor. </p>
     *
     * @param content the {@link com.google.api.services.product.model.Product}
     * @since 1.13
     */
    protected Insert(com.google.api.services.product.model.Product content) {
      super(Product.this, "POST", REST_PATH, content, com.google.api.services.product.model.Product.class);
    }

    @Override
    public Insert setAlt(String alt) {
      return (Insert) super.setAlt(alt);
    }

    @Override
    public Insert setFields(String fields) {
      return (Insert) super.setFields(fields);
    }

    @Override
    public Insert setKey(String key) {
      return (Insert) super.setKey(key);
    }

    @Override
    public Insert setOauthToken(String oauthToken) {
      return (Insert) super.setOauthToken(oauthToken);
    }

    @Override
    public Insert setPrettyPrint(Boolean prettyPrint) {
      return (Insert) super.setPrettyPrint(prettyPrint);
    }

    @Override
    public Insert setQuotaUser(String quotaUser) {
      return (Insert) super.setQuotaUser(quotaUser);
    }

    @Override
    public Insert setUserIp(String userIp) {
      return (Insert) super.setUserIp(userIp);
    }

  }

  /**
   * Create a request for the method "update".
   *
   * This request holds the parameters needed by the the product server.  After setting any optional
   * parameters, call the {@link Update#execute()} method to invoke the remote operation.
   *
   * @param content the {@link com.google.api.services.product.model.Product}
   * @return the request
   */
  public Update update(com.google.api.services.product.model.Product content) throws java.io.IOException {
    Update result = new Update(content);
    initialize(result);
    return result;
  }

  public class Update extends ProductRequest<com.google.api.services.product.model.Product> {

    private static final String REST_PATH = "product";

    /**
     * Create a request for the method "update".
     *
     * This request holds the parameters needed by the the product server.  After setting any optional
     * parameters, call the {@link Update#execute()} method to invoke the remote operation. <p> {@link
     * Update#initialize(AbstractGoogleClientRequest)} must be called to initialize this instance
     * immediately after invoking the constructor. </p>
     *
     * @param content the {@link com.google.api.services.product.model.Product}
     * @since 1.13
     */
    protected Update(com.google.api.services.product.model.Product content) {
      super(Product.this, "PUT", REST_PATH, content, com.google.api.services.product.model.Product.class);
    }

    @Override
    public Update setAlt(String alt) {
      return (Update) super.setAlt(alt);
    }

    @Override
    public Update setFields(String fields) {
      return (Update) super.setFields(fields);
    }

    @Override
    public Update setKey(String key) {
      return (Update) super.setKey(key);
    }

    @Override
    public Update setOauthToken(String oauthToken) {
      return (Update) super.setOauthToken(oauthToken);
    }

    @Override
    public Update setPrettyPrint(Boolean prettyPrint) {
      return (Update) super.setPrettyPrint(prettyPrint);
    }

    @Override
    public Update setQuotaUser(String quotaUser) {
      return (Update) super.setQuotaUser(quotaUser);
    }

    @Override
    public Update setUserIp(String userIp) {
      return (Update) super.setUserIp(userIp);
    }

  }

  /**
   * Builder for {@link Product}.
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

    /** Builds a new instance of {@link Product}. */
    @Override
    public Product build() {
      return new Product(getTransport(),
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
     * Set the {@link ProductRequestInitializer}.
     *
     * @since 1.12
     */
    public Builder setProductRequestInitializer(
        ProductRequestInitializer productRequestInitializer) {
      return (Builder) super.setGoogleClientRequestInitializer(productRequestInitializer);
    }

    @Override
    public Builder setGoogleClientRequestInitializer(
        GoogleClientRequestInitializer googleClientRequestInitializer) {
      return (Builder) super.setGoogleClientRequestInitializer(googleClientRequestInitializer);
    }
  }
}

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
 * Warning! This file is generated. Modify at your own risk.
 */

package com.google.api.services.product.model;

import com.google.api.client.json.GenericJson;

/**
 * Model definition for Product.
 *
 * <p> This is the Java data model class that specifies how to parse/serialize into the JSON that is
 * transmitted over HTTP when working with the . For a detailed explanation see:
 * <a href="http://code.google.com/p/google-api-java-client/wiki/Json">http://code.google.com/p/google-api-java-client/wiki/Json</a>
 * </p>
 *
 * <p>
 * Upgrade warning: starting with version 1.12 {@code getResponseHeaders()} is removed, instead use
 * {@link com.google.api.client.http.json.JsonHttpRequest#getLastResponseHeaders()}
 * </p>
 *
 * @author Google, Inc.
 */
@SuppressWarnings("javadoc")
public final class Product extends GenericJson {

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private String imageUrl;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private Key key;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private Integer priceTime100;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private String productDiscription;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private String productName;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private String upcCode;

  /**

   * The value returned may be {@code null}.
   */
  public String getImageUrl() {
    return imageUrl;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public Key getKey() {
    return key;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setKey(Key key) {
    this.key = key;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public Integer getPriceTime100() {
    return priceTime100;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setPriceTime100(Integer priceTime100) {
    this.priceTime100 = priceTime100;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public String getProductDiscription() {
    return productDiscription;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setProductDiscription(String productDiscription) {
    this.productDiscription = productDiscription;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public String getProductName() {
    return productName;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setProductName(String productName) {
    this.productName = productName;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public String getUpcCode() {
    return upcCode;
  }

  /**

   * The value set may be {@code null}.
   */
  public Product setUpcCode(String upcCode) {
    this.upcCode = upcCode;
    return this;
  }

}

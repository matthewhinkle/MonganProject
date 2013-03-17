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

package com.google.api.services.useritems.model;

import com.google.api.client.json.GenericJson;
import com.google.api.client.json.JsonString;

/**
 * Model definition for DesiredItem.
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
public final class DesiredItem extends GenericJson {

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key @JsonString
  private Long desired;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private Key key;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key @JsonString
  private Long owned;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private Key productKey;

  /**
   * The value may be {@code null}.
   */
  @com.google.api.client.util.Key
  private String userId;

  /**

   * The value returned may be {@code null}.
   */
  public Long getDesired() {
    return desired;
  }

  /**

   * The value set may be {@code null}.
   */
  public DesiredItem setDesired(Long desired) {
    this.desired = desired;
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
  public DesiredItem setKey(Key key) {
    this.key = key;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public Long getOwned() {
    return owned;
  }

  /**

   * The value set may be {@code null}.
   */
  public DesiredItem setOwned(Long owned) {
    this.owned = owned;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public Key getProductKey() {
    return productKey;
  }

  /**

   * The value set may be {@code null}.
   */
  public DesiredItem setProductKey(Key productKey) {
    this.productKey = productKey;
    return this;
  }

  /**

   * The value returned may be {@code null}.
   */
  public String getUserId() {
    return userId;
  }

  /**

   * The value set may be {@code null}.
   */
  public DesiredItem setUserId(String userId) {
    this.userId = userId;
    return this;
  }

}

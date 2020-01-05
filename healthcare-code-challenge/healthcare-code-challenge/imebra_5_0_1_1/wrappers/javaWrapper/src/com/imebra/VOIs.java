/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.imebra;

public class VOIs {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected VOIs(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(VOIs obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        imebraJNI.delete_VOIs(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public VOIs() {
    this(imebraJNI.new_VOIs__SWIG_0(), true);
  }

  public VOIs(long n) {
    this(imebraJNI.new_VOIs__SWIG_1(n), true);
  }

  public long size() {
    return imebraJNI.VOIs_size(swigCPtr, this);
  }

  public long capacity() {
    return imebraJNI.VOIs_capacity(swigCPtr, this);
  }

  public void reserve(long n) {
    imebraJNI.VOIs_reserve(swigCPtr, this, n);
  }

  public boolean isEmpty() {
    return imebraJNI.VOIs_isEmpty(swigCPtr, this);
  }

  public void clear() {
    imebraJNI.VOIs_clear(swigCPtr, this);
  }

  public void add(SWIGTYPE_p_imebra__VOIDescription x) {
    imebraJNI.VOIs_add(swigCPtr, this, SWIGTYPE_p_imebra__VOIDescription.getCPtr(x));
  }

  public SWIGTYPE_p_imebra__VOIDescription get(int i) {
    return new SWIGTYPE_p_imebra__VOIDescription(imebraJNI.VOIs_get(swigCPtr, this, i), false);
  }

  public void set(int i, SWIGTYPE_p_imebra__VOIDescription val) {
    imebraJNI.VOIs_set(swigCPtr, this, i, SWIGTYPE_p_imebra__VOIDescription.getCPtr(val));
  }

}
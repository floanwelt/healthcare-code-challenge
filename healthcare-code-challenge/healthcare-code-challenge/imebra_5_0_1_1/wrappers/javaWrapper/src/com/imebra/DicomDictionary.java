/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.imebra;

public class DicomDictionary {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected DicomDictionary(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(DicomDictionary obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        imebraJNI.delete_DicomDictionary(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public static String getTagDescription(TagId id) {
    return imebraJNI.DicomDictionary_getTagDescription(TagId.getCPtr(id), id);
  }

  public static tagVR_t getTagType(TagId id) {
    return tagVR_t.swigToEnum(imebraJNI.DicomDictionary_getTagType(TagId.getCPtr(id), id));
  }

  public static long getMultiplicityMin(TagId id) {
    return imebraJNI.DicomDictionary_getMultiplicityMin(TagId.getCPtr(id), id);
  }

  public static long getMultiplicityMax(TagId id) {
    return imebraJNI.DicomDictionary_getMultiplicityMax(TagId.getCPtr(id), id);
  }

  public static long getMultiplicityStep(TagId id) {
    return imebraJNI.DicomDictionary_getMultiplicityStep(TagId.getCPtr(id), id);
  }

  public static long getWordSize(tagVR_t dataType) {
    return imebraJNI.DicomDictionary_getWordSize(dataType.swigValue());
  }

  public static long getMaxSize(tagVR_t dataType) {
    return imebraJNI.DicomDictionary_getMaxSize(dataType.swigValue());
  }

  public DicomDictionary() {
    this(imebraJNI.new_DicomDictionary(), true);
  }

}
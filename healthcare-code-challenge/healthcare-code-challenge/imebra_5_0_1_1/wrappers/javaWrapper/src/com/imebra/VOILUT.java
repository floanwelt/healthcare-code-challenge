/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.imebra;

public class VOILUT extends Transform {
  private transient long swigCPtr;

  protected VOILUT(long cPtr, boolean cMemoryOwn) {
    super(imebraJNI.VOILUT_SWIGUpcast(cPtr), cMemoryOwn);
    swigCPtr = cPtr;
  }

  protected static long getCPtr(VOILUT obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        imebraJNI.delete_VOILUT(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  public VOILUT(VOILUT source) {
    this(imebraJNI.new_VOILUT__SWIG_0(VOILUT.getCPtr(source), source), true);
  }

  public VOILUT(LUT lut) {
    this(imebraJNI.new_VOILUT__SWIG_1(LUT.getCPtr(lut), lut), true);
  }

  public VOILUT(SWIGTYPE_p_imebra__VOIDescription voiDescription) {
    this(imebraJNI.new_VOILUT__SWIG_2(SWIGTYPE_p_imebra__VOIDescription.getCPtr(voiDescription)), true);
  }

  public static SWIGTYPE_p_imebra__VOIDescription getOptimalVOI(Image inputImage, long topLeftX, long topLeftY, long width, long height) {
    return new SWIGTYPE_p_imebra__VOIDescription(imebraJNI.VOILUT_getOptimalVOI(Image.getCPtr(inputImage), inputImage, topLeftX, topLeftY, width, height), true);
  }

}
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ConsoleApplication1;
using System.Collections.Generic;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Matrix matrix = new Matrix(3, 5, "**.........*...");

            string[][] actual = matrix.MatrixArray;

            Assert.AreEqual(3, actual.Length);
        }
    }
}
